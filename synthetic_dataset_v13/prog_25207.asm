; DESCRIPTION: Renders a magenta line between points (441, 54) and (17, 221).
; PLAN: r0=441(x1), r1=54(y1), r2=17(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 54
LDI r2, 17
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
