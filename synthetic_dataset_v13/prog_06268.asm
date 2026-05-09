; DESCRIPTION: Places a yellow line segment connecting (108, 150) to (390, 235).
; PLAN: r0=108(x1), r1=150(y1), r2=390(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 150
LDI r2, 390
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
