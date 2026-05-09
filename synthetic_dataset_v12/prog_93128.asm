; DESCRIPTION: Draws a magenta rectangle at (470, 96) with width 35 and height 71.
; PLAN: r0=470(x), r1=96(y), r2=35(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 96
LDI r2, 35
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
