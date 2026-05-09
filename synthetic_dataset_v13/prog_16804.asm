; DESCRIPTION: Places a green line segment connecting (273, 21) to (251, 138).
; PLAN: r0=273(x1), r1=21(y1), r2=251(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 21
LDI r2, 251
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
