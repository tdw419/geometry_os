; DESCRIPTION: Draws a purple rectangle at (160, 68) with width 32 and height 114.
; PLAN: r0=160(x), r1=68(y), r2=32(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 68
LDI r2, 32
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
