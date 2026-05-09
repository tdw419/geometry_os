; DESCRIPTION: Renders a blue line between points (423, 204) and (61, 102).
; PLAN: r0=423(x1), r1=204(y1), r2=61(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 204
LDI r2, 61
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
