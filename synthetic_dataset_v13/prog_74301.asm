; DESCRIPTION: Places a red line segment connecting (160, 235) to (351, 98).
; PLAN: r0=160(x1), r1=235(y1), r2=351(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 235
LDI r2, 351
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
