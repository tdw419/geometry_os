; DESCRIPTION: Places a black line segment connecting (160, 220) to (253, 169).
; PLAN: r0=160(x1), r1=220(y1), r2=253(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 220
LDI r2, 253
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
