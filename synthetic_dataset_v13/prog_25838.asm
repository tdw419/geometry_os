; DESCRIPTION: Places a red line segment connecting (150, 245) to (44, 235).
; PLAN: r0=150(x1), r1=245(y1), r2=44(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 245
LDI r2, 44
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
