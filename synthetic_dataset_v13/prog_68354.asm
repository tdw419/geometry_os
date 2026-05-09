; DESCRIPTION: Places a black line segment connecting (510, 137) to (493, 250).
; PLAN: r0=510(x1), r1=137(y1), r2=493(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 137
LDI r2, 493
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
