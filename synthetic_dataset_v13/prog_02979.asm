; DESCRIPTION: Places a blue line segment connecting (439, 154) to (198, 140).
; PLAN: r0=439(x1), r1=154(y1), r2=198(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 154
LDI r2, 198
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
