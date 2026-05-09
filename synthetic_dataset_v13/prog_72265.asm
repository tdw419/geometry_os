; DESCRIPTION: Places a green line segment connecting (98, 103) to (400, 216).
; PLAN: r0=98(x1), r1=103(y1), r2=400(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 103
LDI r2, 400
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
