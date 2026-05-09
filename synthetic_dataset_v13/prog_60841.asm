; DESCRIPTION: Draws a green rectangle at (3, 127) with width 17 and height 90.
; PLAN: r0=3(x), r1=127(y), r2=17(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 127
LDI r2, 17
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
