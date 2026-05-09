; DESCRIPTION: Draws a blue rectangle at (10, 93) with width 96 and height 101.
; PLAN: r0=10(x), r1=93(y), r2=96(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 93
LDI r2, 96
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
