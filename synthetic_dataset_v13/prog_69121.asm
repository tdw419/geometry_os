; DESCRIPTION: Renders a blue box of size 119x112 starting at (176, 140).
; PLAN: r0=176(x), r1=140(y), r2=119(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 140
LDI r2, 119
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
