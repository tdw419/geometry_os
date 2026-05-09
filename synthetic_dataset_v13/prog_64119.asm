; DESCRIPTION: Renders a black line between points (147, 243) and (412, 150).
; PLAN: r0=147(x1), r1=243(y1), r2=412(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 243
LDI r2, 412
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
