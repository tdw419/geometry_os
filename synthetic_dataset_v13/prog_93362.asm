; DESCRIPTION: Draws a purple rectangle at (312, 60) with width 103 and height 21.
; PLAN: r0=312(x), r1=60(y), r2=103(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 60
LDI r2, 103
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
