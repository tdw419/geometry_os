; DESCRIPTION: Places a green line segment connecting (251, 51) to (260, 233).
; PLAN: r0=251(x1), r1=51(y1), r2=260(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 51
LDI r2, 260
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
