; DESCRIPTION: Renders a blue line between points (27, 160) and (378, 114).
; PLAN: r0=27(x1), r1=160(y1), r2=378(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 160
LDI r2, 378
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
