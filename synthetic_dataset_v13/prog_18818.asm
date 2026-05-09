; DESCRIPTION: Draws a purple rectangle at (240, 13) with width 103 and height 116.
; PLAN: r0=240(x), r1=13(y), r2=103(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 13
LDI r2, 103
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
