; DESCRIPTION: Places a green line segment connecting (437, 200) to (328, 17).
; PLAN: r0=437(x1), r1=200(y1), r2=328(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 200
LDI r2, 328
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
