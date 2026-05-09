; DESCRIPTION: Places a black 57x38 rectangle at position (119, 174).
; PLAN: r0=119(x), r1=174(y), r2=57(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 174
LDI r2, 57
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
