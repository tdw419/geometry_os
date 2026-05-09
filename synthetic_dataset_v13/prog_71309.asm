; DESCRIPTION: Renders a yellow line between points (16, 201) and (7, 170).
; PLAN: r0=16(x1), r1=201(y1), r2=7(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 201
LDI r2, 7
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
