; DESCRIPTION: Renders a black line between points (209, 80) and (459, 147).
; PLAN: r0=209(x1), r1=80(y1), r2=459(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 80
LDI r2, 459
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
