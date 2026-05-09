; DESCRIPTION: Renders a blue line between points (444, 152) and (221, 212).
; PLAN: r0=444(x1), r1=152(y1), r2=221(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 152
LDI r2, 221
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
