; DESCRIPTION: Draws a purple rectangle at (329, 116) with width 86 and height 30.
; PLAN: r0=329(x), r1=116(y), r2=86(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 116
LDI r2, 86
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
