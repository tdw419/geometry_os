; DESCRIPTION: Renders a blue line between points (178, 131) and (186, 14).
; PLAN: r0=178(x1), r1=131(y1), r2=186(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 131
LDI r2, 186
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
