; DESCRIPTION: Places a yellow line segment connecting (223, 44) to (250, 6).
; PLAN: r0=223(x1), r1=44(y1), r2=250(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 44
LDI r2, 250
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
