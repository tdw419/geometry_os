; DESCRIPTION: Places a yellow line segment connecting (169, 230) to (498, 45).
; PLAN: r0=169(x1), r1=230(y1), r2=498(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 230
LDI r2, 498
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
