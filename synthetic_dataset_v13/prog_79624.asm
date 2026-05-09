; DESCRIPTION: Draws a purple rectangle at (385, 92) with width 103 and height 72.
; PLAN: r0=385(x), r1=92(y), r2=103(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 92
LDI r2, 103
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
