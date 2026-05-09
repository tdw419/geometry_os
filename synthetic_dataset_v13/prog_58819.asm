; DESCRIPTION: Draws a magenta rectangle at (465, 2) with width 17 and height 94.
; PLAN: r0=465(x), r1=2(y), r2=17(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 2
LDI r2, 17
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
