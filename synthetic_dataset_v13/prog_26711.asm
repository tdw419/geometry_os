; DESCRIPTION: Places a white line segment connecting (440, 182) to (77, 185).
; PLAN: r0=440(x1), r1=182(y1), r2=77(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 182
LDI r2, 77
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
