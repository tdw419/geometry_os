; DESCRIPTION: Renders a blue line between points (308, 13) and (411, 6).
; PLAN: r0=308(x1), r1=13(y1), r2=411(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 13
LDI r2, 411
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
