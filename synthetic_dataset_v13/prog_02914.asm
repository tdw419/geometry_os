; DESCRIPTION: Draws a purple rectangle at (353, 60) with width 111 and height 14.
; PLAN: r0=353(x), r1=60(y), r2=111(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 60
LDI r2, 111
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
