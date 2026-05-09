; DESCRIPTION: Renders a blue line between points (252, 251) and (92, 254).
; PLAN: r0=252(x1), r1=251(y1), r2=92(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 251
LDI r2, 92
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
