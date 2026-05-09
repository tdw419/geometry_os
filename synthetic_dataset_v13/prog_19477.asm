; DESCRIPTION: Renders a blue box of size 81x20 starting at (288, 93).
; PLAN: r0=288(x), r1=93(y), r2=81(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 93
LDI r2, 81
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
