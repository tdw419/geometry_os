; DESCRIPTION: Places a red line segment connecting (147, 237) to (150, 22).
; PLAN: r0=147(x1), r1=237(y1), r2=150(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 237
LDI r2, 150
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
