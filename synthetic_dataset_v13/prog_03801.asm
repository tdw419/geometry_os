; DESCRIPTION: Draws a purple rectangle at (317, 140) with width 70 and height 106.
; PLAN: r0=317(x), r1=140(y), r2=70(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 140
LDI r2, 70
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
