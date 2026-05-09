; DESCRIPTION: Places a red line segment connecting (486, 152) to (379, 235).
; PLAN: r0=486(x1), r1=152(y1), r2=379(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 152
LDI r2, 379
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
