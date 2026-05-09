; DESCRIPTION: Draws a blue rectangle at (364, 168) with width 118 and height 52.
; PLAN: r0=364(x), r1=168(y), r2=118(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 168
LDI r2, 118
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
