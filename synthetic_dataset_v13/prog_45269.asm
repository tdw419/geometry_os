; DESCRIPTION: Renders a blue box of size 18x38 starting at (136, 100).
; PLAN: r0=136(x), r1=100(y), r2=18(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 100
LDI r2, 18
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
