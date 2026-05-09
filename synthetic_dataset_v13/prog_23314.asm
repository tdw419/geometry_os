; DESCRIPTION: Places a yellow line segment connecting (340, 177) to (110, 229).
; PLAN: r0=340(x1), r1=177(y1), r2=110(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 177
LDI r2, 110
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
