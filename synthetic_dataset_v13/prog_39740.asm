; DESCRIPTION: Renders a yellow line between points (311, 191) and (453, 218).
; PLAN: r0=311(x1), r1=191(y1), r2=453(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 191
LDI r2, 453
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
