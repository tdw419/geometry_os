; DESCRIPTION: Renders a blue line between points (200, 186) and (472, 192).
; PLAN: r0=200(x1), r1=186(y1), r2=472(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 186
LDI r2, 472
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
