; DESCRIPTION: Renders a blue box of size 58x54 starting at (134, 179).
; PLAN: r0=134(x), r1=179(y), r2=58(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 179
LDI r2, 58
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
