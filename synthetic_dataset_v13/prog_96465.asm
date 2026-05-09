; DESCRIPTION: Places a blue line segment connecting (323, 154) to (470, 204).
; PLAN: r0=323(x1), r1=154(y1), r2=470(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 154
LDI r2, 470
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
