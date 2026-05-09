; DESCRIPTION: Places a black line segment connecting (125, 169) to (206, 65).
; PLAN: r0=125(x1), r1=169(y1), r2=206(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 169
LDI r2, 206
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
