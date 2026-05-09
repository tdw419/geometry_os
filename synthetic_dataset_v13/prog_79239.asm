; DESCRIPTION: Draws a purple rectangle at (110, 96) with width 27 and height 100.
; PLAN: r0=110(x), r1=96(y), r2=27(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 96
LDI r2, 27
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
