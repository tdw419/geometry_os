; DESCRIPTION: Renders a blue box of size 87x101 starting at (111, 106).
; PLAN: r0=111(x), r1=106(y), r2=87(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 106
LDI r2, 87
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
