; DESCRIPTION: Draws a purple rectangle at (186, 65) with width 70 and height 54.
; PLAN: r0=186(x), r1=65(y), r2=70(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 65
LDI r2, 70
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
