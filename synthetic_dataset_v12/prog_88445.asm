; DESCRIPTION: Draws a purple rectangle at (151, 66) with width 58 and height 64.
; PLAN: r0=151(x), r1=66(y), r2=58(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 66
LDI r2, 58
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
