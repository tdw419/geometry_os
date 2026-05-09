; DESCRIPTION: Renders a red line between points (412, 250) and (260, 147).
; PLAN: r0=412(x1), r1=250(y1), r2=260(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 250
LDI r2, 260
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
