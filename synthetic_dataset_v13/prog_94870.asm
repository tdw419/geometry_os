; DESCRIPTION: Renders a blue box of size 59x48 starting at (201, 114).
; PLAN: r0=201(x), r1=114(y), r2=59(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 114
LDI r2, 59
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
