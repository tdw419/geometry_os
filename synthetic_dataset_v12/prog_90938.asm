; DESCRIPTION: Draws a purple rectangle at (189, 179) with width 64 and height 73.
; PLAN: r0=189(x), r1=179(y), r2=64(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 179
LDI r2, 64
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
