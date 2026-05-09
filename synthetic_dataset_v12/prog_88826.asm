; DESCRIPTION: Places a black 74x21 rectangle at position (100, 174).
; PLAN: r0=100(x), r1=174(y), r2=74(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 174
LDI r2, 74
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
