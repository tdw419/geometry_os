; DESCRIPTION: Places a yellow line segment connecting (123, 172) to (286, 130).
; PLAN: r0=123(x1), r1=172(y1), r2=286(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 172
LDI r2, 286
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
