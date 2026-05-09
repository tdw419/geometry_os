; DESCRIPTION: Renders a purple line between points (46, 211) and (290, 100).
; PLAN: r0=46(x1), r1=211(y1), r2=290(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 211
LDI r2, 290
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
