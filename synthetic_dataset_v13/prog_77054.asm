; DESCRIPTION: Draws a red line from (472, 109) to (350, 110).
; PLAN: r0=472(x1), r1=109(y1), r2=350(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 109
LDI r2, 350
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
