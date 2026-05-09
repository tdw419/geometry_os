; DESCRIPTION: Places a white line segment connecting (201, 84) to (84, 235).
; PLAN: r0=201(x1), r1=84(y1), r2=84(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 84
LDI r2, 84
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
