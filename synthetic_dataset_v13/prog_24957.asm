; DESCRIPTION: Renders a blue line between points (236, 218) and (172, 55).
; PLAN: r0=236(x1), r1=218(y1), r2=172(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 218
LDI r2, 172
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
