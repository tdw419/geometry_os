; DESCRIPTION: Draws a red line from (463, 144) to (340, 147).
; PLAN: r0=463(x1), r1=144(y1), r2=340(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 144
LDI r2, 340
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
