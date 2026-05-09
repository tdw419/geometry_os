; DESCRIPTION: Draws a purple rectangle at (188, 5) with width 27 and height 61.
; PLAN: r0=188(x), r1=5(y), r2=27(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 5
LDI r2, 27
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
