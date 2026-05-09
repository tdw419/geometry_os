; DESCRIPTION: Renders a black box of size 56x88 starting at (229, 130).
; PLAN: r0=229(x), r1=130(y), r2=56(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 130
LDI r2, 56
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
