; DESCRIPTION: Places a black line segment connecting (169, 32) to (362, 17).
; PLAN: r0=169(x1), r1=32(y1), r2=362(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 32
LDI r2, 362
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
