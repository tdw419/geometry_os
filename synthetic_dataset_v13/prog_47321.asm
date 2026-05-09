; DESCRIPTION: Draws a purple rectangle at (262, 201) with width 88 and height 46.
; PLAN: r0=262(x), r1=201(y), r2=88(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 201
LDI r2, 88
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
