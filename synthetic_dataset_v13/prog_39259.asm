; DESCRIPTION: Places a green line segment connecting (251, 186) to (51, 109).
; PLAN: r0=251(x1), r1=186(y1), r2=51(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 186
LDI r2, 51
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
