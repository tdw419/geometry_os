; DESCRIPTION: Places a yellow line segment connecting (3, 160) to (389, 235).
; PLAN: r0=3(x1), r1=160(y1), r2=389(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 160
LDI r2, 389
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
