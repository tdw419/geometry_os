; DESCRIPTION: Draws a blue rectangle at (73, 109) with width 118 and height 83.
; PLAN: r0=73(x), r1=109(y), r2=118(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 109
LDI r2, 118
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
