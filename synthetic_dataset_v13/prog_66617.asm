; DESCRIPTION: Renders a yellow line between points (69, 169) and (441, 57).
; PLAN: r0=69(x1), r1=169(y1), r2=441(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 169
LDI r2, 441
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
