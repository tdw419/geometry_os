; DESCRIPTION: Draws a purple rectangle at (369, 127) with width 120 and height 58.
; PLAN: r0=369(x), r1=127(y), r2=120(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 127
LDI r2, 120
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
