; DESCRIPTION: Draws a green rectangle at (279, 111) with width 17 and height 81.
; PLAN: r0=279(x), r1=111(y), r2=17(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 111
LDI r2, 17
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
