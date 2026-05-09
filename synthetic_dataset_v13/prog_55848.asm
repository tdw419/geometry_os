; DESCRIPTION: Draws a yellow rectangle at (84, 179) with width 36 and height 17.
; PLAN: r0=84(x), r1=179(y), r2=36(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 179
LDI r2, 36
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
