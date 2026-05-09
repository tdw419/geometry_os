; DESCRIPTION: Draws a purple rectangle at (103, 55) with width 116 and height 61.
; PLAN: r0=103(x), r1=55(y), r2=116(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 55
LDI r2, 116
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
