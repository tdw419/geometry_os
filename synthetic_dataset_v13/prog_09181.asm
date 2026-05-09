; DESCRIPTION: Places a black 56x95 rectangle at position (165, 46).
; PLAN: r0=165(x), r1=46(y), r2=56(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 46
LDI r2, 56
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
