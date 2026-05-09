; DESCRIPTION: Places a black line segment connecting (169, 208) to (132, 219).
; PLAN: r0=169(x1), r1=208(y1), r2=132(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 208
LDI r2, 132
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
