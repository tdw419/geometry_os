; DESCRIPTION: Places a red line segment connecting (112, 37) to (132, 104).
; PLAN: r0=112(x1), r1=37(y1), r2=132(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 37
LDI r2, 132
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
