; DESCRIPTION: Draws a blue rectangle at (118, 127) with width 54 and height 109.
; PLAN: r0=118(x), r1=127(y), r2=54(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 127
LDI r2, 54
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
