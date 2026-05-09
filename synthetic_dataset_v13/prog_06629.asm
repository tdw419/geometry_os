; DESCRIPTION: Places a yellow line segment connecting (442, 174) to (223, 145).
; PLAN: r0=442(x1), r1=174(y1), r2=223(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 174
LDI r2, 223
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
