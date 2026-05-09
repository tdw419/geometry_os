; DESCRIPTION: Renders a blue box of size 93x84 starting at (1, 75).
; PLAN: r0=1(x), r1=75(y), r2=93(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 75
LDI r2, 93
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
