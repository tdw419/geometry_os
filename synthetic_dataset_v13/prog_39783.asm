; DESCRIPTION: Renders a yellow line between points (216, 1) and (367, 229).
; PLAN: r0=216(x1), r1=1(y1), r2=367(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 1
LDI r2, 367
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
