; DESCRIPTION: Draws a purple rectangle at (311, 186) with width 48 and height 68.
; PLAN: r0=311(x), r1=186(y), r2=48(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 186
LDI r2, 48
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
