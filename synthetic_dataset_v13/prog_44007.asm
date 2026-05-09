; DESCRIPTION: Renders a blue box of size 109x30 starting at (124, 62).
; PLAN: r0=124(x), r1=62(y), r2=109(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 62
LDI r2, 109
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
