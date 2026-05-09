; DESCRIPTION: Places a white line segment connecting (248, 176) to (142, 51).
; PLAN: r0=248(x1), r1=176(y1), r2=142(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 176
LDI r2, 142
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
