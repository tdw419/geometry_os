; DESCRIPTION: Draws a purple rectangle at (237, 38) with width 87 and height 79.
; PLAN: r0=237(x), r1=38(y), r2=87(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 38
LDI r2, 87
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
