; DESCRIPTION: Places a red line segment connecting (243, 110) to (325, 133).
; PLAN: r0=243(x1), r1=110(y1), r2=325(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 110
LDI r2, 325
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
