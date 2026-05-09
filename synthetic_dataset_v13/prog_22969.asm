; DESCRIPTION: Places a red line segment connecting (229, 34) to (345, 235).
; PLAN: r0=229(x1), r1=34(y1), r2=345(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 34
LDI r2, 345
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
