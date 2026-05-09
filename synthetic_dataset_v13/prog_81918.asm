; DESCRIPTION: Places a green line segment connecting (230, 177) to (200, 12).
; PLAN: r0=230(x1), r1=177(y1), r2=200(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 177
LDI r2, 200
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
