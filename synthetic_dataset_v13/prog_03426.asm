; DESCRIPTION: Renders a magenta line between points (347, 186) and (408, 35).
; PLAN: r0=347(x1), r1=186(y1), r2=408(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 186
LDI r2, 408
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
