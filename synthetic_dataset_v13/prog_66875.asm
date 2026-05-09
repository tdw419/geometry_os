; DESCRIPTION: Places a red line segment connecting (110, 230) to (459, 132).
; PLAN: r0=110(x1), r1=230(y1), r2=459(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 230
LDI r2, 459
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
