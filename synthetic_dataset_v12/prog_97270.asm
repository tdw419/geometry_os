; DESCRIPTION: Places a white line segment connecting (325, 242) to (22, 106).
; PLAN: r0=325(x1), r1=242(y1), r2=22(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 242
LDI r2, 22
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
