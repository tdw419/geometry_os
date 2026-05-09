; DESCRIPTION: Places a white line segment connecting (132, 0) to (250, 137).
; PLAN: r0=132(x1), r1=0(y1), r2=250(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 0
LDI r2, 250
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
