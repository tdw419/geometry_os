; DESCRIPTION: Draws a purple rectangle at (335, 30) with width 31 and height 35.
; PLAN: r0=335(x), r1=30(y), r2=31(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 30
LDI r2, 31
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
