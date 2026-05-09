; DESCRIPTION: Places a red line segment connecting (235, 60) to (350, 80).
; PLAN: r0=235(x1), r1=60(y1), r2=350(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 60
LDI r2, 350
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
