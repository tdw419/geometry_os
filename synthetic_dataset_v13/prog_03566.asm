; DESCRIPTION: Renders a blue line between points (147, 214) and (123, 236).
; PLAN: r0=147(x1), r1=214(y1), r2=123(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 214
LDI r2, 123
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
