; DESCRIPTION: Places a green line segment connecting (247, 193) to (185, 216).
; PLAN: r0=247(x1), r1=193(y1), r2=185(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 193
LDI r2, 185
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
