; DESCRIPTION: Renders a blue line between points (462, 167) and (308, 221).
; PLAN: r0=462(x1), r1=167(y1), r2=308(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 167
LDI r2, 308
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
