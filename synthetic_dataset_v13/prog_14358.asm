; DESCRIPTION: Renders a black line between points (140, 208) and (311, 87).
; PLAN: r0=140(x1), r1=208(y1), r2=311(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 208
LDI r2, 311
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
