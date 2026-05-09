; DESCRIPTION: Places a green line segment connecting (431, 250) to (10, 235).
; PLAN: r0=431(x1), r1=250(y1), r2=10(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 250
LDI r2, 10
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
