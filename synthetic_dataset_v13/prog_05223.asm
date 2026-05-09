; DESCRIPTION: Renders a yellow box of size 118x69 starting at (351, 17).
; PLAN: r0=351(x), r1=17(y), r2=118(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 17
LDI r2, 118
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
