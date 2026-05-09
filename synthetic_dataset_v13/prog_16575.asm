; DESCRIPTION: Renders a blue line between points (217, 160) and (202, 147).
; PLAN: r0=217(x1), r1=160(y1), r2=202(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 160
LDI r2, 202
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
