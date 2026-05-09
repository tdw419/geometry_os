; DESCRIPTION: Draws a purple rectangle at (274, 70) with width 111 and height 105.
; PLAN: r0=274(x), r1=70(y), r2=111(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 70
LDI r2, 111
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
