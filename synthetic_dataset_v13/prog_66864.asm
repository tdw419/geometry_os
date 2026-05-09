; DESCRIPTION: Places a blue line segment connecting (486, 204) to (179, 12).
; PLAN: r0=486(x1), r1=204(y1), r2=179(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 204
LDI r2, 179
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
