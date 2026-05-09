; DESCRIPTION: Places a green line segment connecting (211, 14) to (63, 80).
; PLAN: r0=211(x1), r1=14(y1), r2=63(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 14
LDI r2, 63
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
