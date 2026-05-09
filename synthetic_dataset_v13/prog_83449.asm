; DESCRIPTION: Places a black line segment connecting (69, 123) to (253, 234).
; PLAN: r0=69(x1), r1=123(y1), r2=253(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 123
LDI r2, 253
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
