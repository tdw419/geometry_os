; DESCRIPTION: Places a black line segment connecting (147, 177) to (208, 86).
; PLAN: r0=147(x1), r1=177(y1), r2=208(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 177
LDI r2, 208
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
