; DESCRIPTION: Places a white line segment connecting (374, 200) to (402, 34).
; PLAN: r0=374(x1), r1=200(y1), r2=402(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 200
LDI r2, 402
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
