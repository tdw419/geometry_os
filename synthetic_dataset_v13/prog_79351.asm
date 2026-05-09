; DESCRIPTION: Draws a purple rectangle at (5, 150) with width 94 and height 93.
; PLAN: r0=5(x), r1=150(y), r2=94(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 150
LDI r2, 94
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
