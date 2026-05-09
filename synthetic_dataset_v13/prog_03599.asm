; DESCRIPTION: Renders a blue box of size 15x101 starting at (336, 79).
; PLAN: r0=336(x), r1=79(y), r2=15(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 79
LDI r2, 15
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
