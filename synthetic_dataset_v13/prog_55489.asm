; DESCRIPTION: Draws a black rectangle at (393, 172) with width 11 and height 35.
; PLAN: r0=393(x), r1=172(y), r2=11(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 172
LDI r2, 11
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
