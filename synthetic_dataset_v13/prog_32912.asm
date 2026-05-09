; DESCRIPTION: Draws a purple rectangle at (297, 70) with width 72 and height 90.
; PLAN: r0=297(x), r1=70(y), r2=72(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 70
LDI r2, 72
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
