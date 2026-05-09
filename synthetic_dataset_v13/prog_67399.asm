; DESCRIPTION: Places a red line segment connecting (90, 218) to (235, 53).
; PLAN: r0=90(x1), r1=218(y1), r2=235(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 218
LDI r2, 235
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
