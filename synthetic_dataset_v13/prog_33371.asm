; DESCRIPTION: Places a red line segment connecting (245, 124) to (30, 235).
; PLAN: r0=245(x1), r1=124(y1), r2=30(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 124
LDI r2, 30
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
