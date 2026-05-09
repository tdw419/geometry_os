; DESCRIPTION: Draws a purple rectangle at (456, 128) with width 49 and height 45.
; PLAN: r0=456(x), r1=128(y), r2=49(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 128
LDI r2, 49
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
