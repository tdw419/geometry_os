; DESCRIPTION: Places a red line segment connecting (273, 174) to (431, 127).
; PLAN: r0=273(x1), r1=174(y1), r2=431(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 174
LDI r2, 431
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
