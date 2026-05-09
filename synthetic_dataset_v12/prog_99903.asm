; DESCRIPTION: Places a red line segment connecting (201, 220) to (153, 242).
; PLAN: r0=201(x1), r1=220(y1), r2=153(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 220
LDI r2, 153
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
