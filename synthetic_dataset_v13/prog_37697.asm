; DESCRIPTION: Draws a green rectangle at (319, 18) with width 17 and height 65.
; PLAN: r0=319(x), r1=18(y), r2=17(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 18
LDI r2, 17
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
