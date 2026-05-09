; DESCRIPTION: Draws a blue line from (269, 48) to (147, 227).
; PLAN: r0=269(x1), r1=48(y1), r2=147(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 48
LDI r2, 147
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
