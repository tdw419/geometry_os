; DESCRIPTION: Draws a black rectangle at (195, 6) with width 11 and height 110.
; PLAN: r0=195(x), r1=6(y), r2=11(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 6
LDI r2, 11
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
