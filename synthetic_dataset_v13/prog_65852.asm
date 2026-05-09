; DESCRIPTION: Places a yellow line segment connecting (402, 71) to (462, 153).
; PLAN: r0=402(x1), r1=71(y1), r2=462(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 71
LDI r2, 462
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
