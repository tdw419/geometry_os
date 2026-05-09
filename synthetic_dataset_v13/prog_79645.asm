; DESCRIPTION: Renders a blue box of size 76x118 starting at (123, 93).
; PLAN: r0=123(x), r1=93(y), r2=76(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 93
LDI r2, 76
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
