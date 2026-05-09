; DESCRIPTION: Places a black line segment connecting (428, 106) to (425, 79).
; PLAN: r0=428(x1), r1=106(y1), r2=425(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 106
LDI r2, 425
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
