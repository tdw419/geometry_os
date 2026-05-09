; DESCRIPTION: Draws a blue rectangle at (158, 59) with width 20 and height 46.
; PLAN: r0=158(x), r1=59(y), r2=20(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 59
LDI r2, 20
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
