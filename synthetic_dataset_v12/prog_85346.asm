; DESCRIPTION: Draws a purple rectangle at (335, 21) with width 120 and height 87.
; PLAN: r0=335(x), r1=21(y), r2=120(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 21
LDI r2, 120
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
