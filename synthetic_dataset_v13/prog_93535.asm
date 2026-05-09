; DESCRIPTION: Places a red line segment connecting (331, 179) to (277, 77).
; PLAN: r0=331(x1), r1=179(y1), r2=277(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 179
LDI r2, 277
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
