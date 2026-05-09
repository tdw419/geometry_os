; DESCRIPTION: Renders a yellow line between points (225, 191) and (170, 199).
; PLAN: r0=225(x1), r1=191(y1), r2=170(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 191
LDI r2, 170
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
