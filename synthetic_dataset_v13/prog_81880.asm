; DESCRIPTION: Draws a blue rectangle at (7, 36) with width 59 and height 118.
; PLAN: r0=7(x), r1=36(y), r2=59(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 36
LDI r2, 59
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
