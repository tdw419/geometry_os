; DESCRIPTION: Renders a purple line between points (106, 112) and (502, 247).
; PLAN: r0=106(x1), r1=112(y1), r2=502(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 112
LDI r2, 502
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
