; DESCRIPTION: Places a white line segment connecting (361, 156) to (486, 221).
; PLAN: r0=361(x1), r1=156(y1), r2=486(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 156
LDI r2, 486
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
