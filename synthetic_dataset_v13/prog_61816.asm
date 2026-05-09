; DESCRIPTION: Renders a magenta line between points (170, 182) and (441, 130).
; PLAN: r0=170(x1), r1=182(y1), r2=441(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 182
LDI r2, 441
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
