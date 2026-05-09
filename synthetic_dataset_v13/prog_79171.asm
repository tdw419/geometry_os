; DESCRIPTION: Draws a purple rectangle at (334, 92) with width 81 and height 32.
; PLAN: r0=334(x), r1=92(y), r2=81(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 92
LDI r2, 81
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
