; DESCRIPTION: Renders a yellow box of size 114x104 starting at (89, 130).
; PLAN: r0=89(x), r1=130(y), r2=114(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 130
LDI r2, 114
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
