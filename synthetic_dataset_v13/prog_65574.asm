; DESCRIPTION: Renders a blue box of size 85x101 starting at (93, 131).
; PLAN: r0=93(x), r1=131(y), r2=85(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 131
LDI r2, 85
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
