; DESCRIPTION: Renders a blue line between points (188, 107) and (431, 107).
; PLAN: r0=188(x1), r1=107(y1), r2=431(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 107
LDI r2, 431
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
