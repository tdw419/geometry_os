; DESCRIPTION: Places a blue line segment connecting (486, 221) to (414, 91).
; PLAN: r0=486(x1), r1=221(y1), r2=414(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 221
LDI r2, 414
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
