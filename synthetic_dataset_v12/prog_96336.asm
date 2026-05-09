; DESCRIPTION: Renders a blue box of size 112x101 starting at (215, 130).
; PLAN: r0=215(x), r1=130(y), r2=112(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 130
LDI r2, 112
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
