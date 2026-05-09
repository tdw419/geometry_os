; DESCRIPTION: Renders a magenta line between points (321, 81) and (508, 208).
; PLAN: r0=321(x1), r1=81(y1), r2=508(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 81
LDI r2, 508
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
