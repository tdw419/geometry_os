; DESCRIPTION: Draws a purple rectangle at (35, 159) with width 64 and height 58.
; PLAN: r0=35(x), r1=159(y), r2=64(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 159
LDI r2, 64
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
