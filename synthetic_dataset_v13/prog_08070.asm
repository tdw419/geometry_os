; DESCRIPTION: Places a red line segment connecting (407, 132) to (504, 127).
; PLAN: r0=407(x1), r1=132(y1), r2=504(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 132
LDI r2, 504
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
