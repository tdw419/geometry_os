; DESCRIPTION: Places a green line segment connecting (398, 179) to (201, 243).
; PLAN: r0=398(x1), r1=179(y1), r2=201(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 179
LDI r2, 201
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
