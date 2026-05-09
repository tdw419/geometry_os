; DESCRIPTION: Renders a blue line between points (147, 173) and (105, 77).
; PLAN: r0=147(x1), r1=173(y1), r2=105(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 173
LDI r2, 105
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
