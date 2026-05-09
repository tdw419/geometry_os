; DESCRIPTION: Renders a blue box of size 87x96 starting at (270, 93).
; PLAN: r0=270(x), r1=93(y), r2=87(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 93
LDI r2, 87
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
