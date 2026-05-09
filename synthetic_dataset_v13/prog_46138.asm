; DESCRIPTION: Draws a purple rectangle at (408, 103) with width 66 and height 56.
; PLAN: r0=408(x), r1=103(y), r2=66(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 103
LDI r2, 66
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
