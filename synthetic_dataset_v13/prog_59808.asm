; DESCRIPTION: Draws a purple rectangle at (263, 202) with width 62 and height 30.
; PLAN: r0=263(x), r1=202(y), r2=62(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 202
LDI r2, 62
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
