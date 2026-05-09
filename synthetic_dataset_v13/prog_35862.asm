; DESCRIPTION: Places a red line segment connecting (331, 127) to (278, 1).
; PLAN: r0=331(x1), r1=127(y1), r2=278(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 127
LDI r2, 278
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
