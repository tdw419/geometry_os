; DESCRIPTION: Places a green line segment connecting (56, 131) to (229, 152).
; PLAN: r0=56(x1), r1=131(y1), r2=229(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 131
LDI r2, 229
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
