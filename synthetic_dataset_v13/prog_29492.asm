; DESCRIPTION: Places a blue line segment connecting (487, 137) to (510, 8).
; PLAN: r0=487(x1), r1=137(y1), r2=510(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 137
LDI r2, 510
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
