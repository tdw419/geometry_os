; DESCRIPTION: Draws a black rectangle at (144, 117) with width 33 and height 20.
; PLAN: r0=144(x), r1=117(y), r2=33(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 117
LDI r2, 33
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
