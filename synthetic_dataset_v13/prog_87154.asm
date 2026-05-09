; DESCRIPTION: Places a white line segment connecting (147, 186) to (2, 162).
; PLAN: r0=147(x1), r1=186(y1), r2=2(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 186
LDI r2, 2
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
