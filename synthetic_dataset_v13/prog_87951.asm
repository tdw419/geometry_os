; DESCRIPTION: Draws a black rectangle at (77, 23) with width 119 and height 82.
; PLAN: r0=77(x), r1=23(y), r2=119(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 23
LDI r2, 119
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
