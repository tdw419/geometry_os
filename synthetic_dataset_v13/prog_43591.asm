; DESCRIPTION: Draws a purple rectangle at (448, 132) with width 10 and height 32.
; PLAN: r0=448(x), r1=132(y), r2=10(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 132
LDI r2, 10
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
