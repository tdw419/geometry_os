; DESCRIPTION: Renders a blue line between points (420, 153) and (186, 9).
; PLAN: r0=420(x1), r1=153(y1), r2=186(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 153
LDI r2, 186
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
