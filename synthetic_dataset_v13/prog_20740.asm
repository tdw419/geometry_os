; DESCRIPTION: Renders a yellow line between points (77, 216) and (275, 160).
; PLAN: r0=77(x1), r1=216(y1), r2=275(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 216
LDI r2, 275
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
