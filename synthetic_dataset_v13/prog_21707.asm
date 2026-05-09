; DESCRIPTION: Draws a purple rectangle at (151, 132) with width 120 and height 34.
; PLAN: r0=151(x), r1=132(y), r2=120(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 132
LDI r2, 120
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
