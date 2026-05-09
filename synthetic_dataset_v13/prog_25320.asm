; DESCRIPTION: Renders a blue box of size 62x109 starting at (424, 130).
; PLAN: r0=424(x), r1=130(y), r2=62(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 130
LDI r2, 62
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
