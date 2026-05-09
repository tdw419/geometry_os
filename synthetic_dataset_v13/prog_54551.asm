; DESCRIPTION: Draws a purple rectangle at (251, 51) with width 32 and height 10.
; PLAN: r0=251(x), r1=51(y), r2=32(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 51
LDI r2, 32
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
