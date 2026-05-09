; DESCRIPTION: Draws a purple rectangle at (145, 114) with width 93 and height 61.
; PLAN: r0=145(x), r1=114(y), r2=93(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 114
LDI r2, 93
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
