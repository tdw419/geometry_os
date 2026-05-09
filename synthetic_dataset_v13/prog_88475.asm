; DESCRIPTION: Draws a yellow line from (482, 137) to (347, 169).
; PLAN: r0=482(x1), r1=137(y1), r2=347(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 137
LDI r2, 347
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
