; DESCRIPTION: Places a red line segment connecting (331, 250) to (464, 229).
; PLAN: r0=331(x1), r1=250(y1), r2=464(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 250
LDI r2, 464
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
