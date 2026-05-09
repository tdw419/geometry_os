; DESCRIPTION: Renders a magenta line between points (431, 110) and (304, 169).
; PLAN: r0=431(x1), r1=110(y1), r2=304(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 110
LDI r2, 304
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
