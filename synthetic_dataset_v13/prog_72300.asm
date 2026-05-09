; DESCRIPTION: Renders a purple line between points (408, 159) and (311, 208).
; PLAN: r0=408(x1), r1=159(y1), r2=311(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 159
LDI r2, 311
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
