; DESCRIPTION: Renders a blue box of size 32x13 starting at (462, 148).
; PLAN: r0=462(x), r1=148(y), r2=32(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 148
LDI r2, 32
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
