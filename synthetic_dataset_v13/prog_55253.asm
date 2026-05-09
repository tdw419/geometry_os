; DESCRIPTION: Draws a purple rectangle at (389, 64) with width 102 and height 120.
; PLAN: r0=389(x), r1=64(y), r2=102(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 64
LDI r2, 102
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
