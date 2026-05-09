; DESCRIPTION: Draws a blue rectangle at (322, 216) with width 68 and height 24.
; PLAN: r0=322(x), r1=216(y), r2=68(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 216
LDI r2, 68
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
