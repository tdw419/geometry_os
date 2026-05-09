; DESCRIPTION: Places a red line segment connecting (351, 107) to (235, 42).
; PLAN: r0=351(x1), r1=107(y1), r2=235(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 107
LDI r2, 235
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
