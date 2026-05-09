; DESCRIPTION: Renders a blue line between points (465, 186) and (506, 245).
; PLAN: r0=465(x1), r1=186(y1), r2=506(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 186
LDI r2, 506
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
