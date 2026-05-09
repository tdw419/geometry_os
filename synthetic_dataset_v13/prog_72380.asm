; DESCRIPTION: Places a black line segment connecting (409, 80) to (211, 117).
; PLAN: r0=409(x1), r1=80(y1), r2=211(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 80
LDI r2, 211
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
