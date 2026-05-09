; DESCRIPTION: Places a yellow line segment connecting (126, 8) to (106, 130).
; PLAN: r0=126(x1), r1=8(y1), r2=106(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 8
LDI r2, 106
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
