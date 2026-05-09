; DESCRIPTION: Renders a purple line between points (234, 68) and (508, 186).
; PLAN: r0=234(x1), r1=68(y1), r2=508(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 68
LDI r2, 508
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
