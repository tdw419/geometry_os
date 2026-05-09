; DESCRIPTION: Renders a yellow box of size 12x101 starting at (409, 114).
; PLAN: r0=409(x), r1=114(y), r2=12(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 114
LDI r2, 12
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
