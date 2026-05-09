; DESCRIPTION: Places a yellow line segment connecting (70, 225) to (433, 229).
; PLAN: r0=70(x1), r1=225(y1), r2=433(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 225
LDI r2, 433
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
