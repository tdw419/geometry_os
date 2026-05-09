; DESCRIPTION: Draws a purple rectangle at (45, 96) with width 60 and height 116.
; PLAN: r0=45(x), r1=96(y), r2=60(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 96
LDI r2, 60
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
