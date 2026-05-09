; DESCRIPTION: Places a black line segment connecting (115, 185) to (169, 164).
; PLAN: r0=115(x1), r1=185(y1), r2=169(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 185
LDI r2, 169
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
