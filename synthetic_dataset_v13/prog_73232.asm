; DESCRIPTION: Places a black line segment connecting (278, 74) to (106, 199).
; PLAN: r0=278(x1), r1=74(y1), r2=106(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 74
LDI r2, 106
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
