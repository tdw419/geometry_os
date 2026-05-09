; DESCRIPTION: Draws a green rectangle at (17, 79) with width 25 and height 37.
; PLAN: r0=17(x), r1=79(y), r2=25(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 79
LDI r2, 25
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
