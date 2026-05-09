; DESCRIPTION: Draws a green rectangle at (492, 60) with width 17 and height 99.
; PLAN: r0=492(x), r1=60(y), r2=17(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 60
LDI r2, 17
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
