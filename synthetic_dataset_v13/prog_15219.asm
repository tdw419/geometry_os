; DESCRIPTION: Draws a purple rectangle at (126, 77) with width 78 and height 120.
; PLAN: r0=126(x), r1=77(y), r2=78(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 77
LDI r2, 78
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
