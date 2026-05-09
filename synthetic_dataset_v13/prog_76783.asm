; DESCRIPTION: Renders a blue box of size 119x100 starting at (23, 153).
; PLAN: r0=23(x), r1=153(y), r2=119(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 153
LDI r2, 119
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
