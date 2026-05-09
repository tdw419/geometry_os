; DESCRIPTION: Renders a blue box of size 100x37 starting at (204, 59).
; PLAN: r0=204(x), r1=59(y), r2=100(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 59
LDI r2, 100
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
