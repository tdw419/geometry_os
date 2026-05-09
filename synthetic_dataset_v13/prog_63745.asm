; DESCRIPTION: Places a white line segment connecting (273, 236) to (483, 17).
; PLAN: r0=273(x1), r1=236(y1), r2=483(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 236
LDI r2, 483
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
