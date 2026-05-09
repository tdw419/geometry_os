; DESCRIPTION: Places a green line segment connecting (377, 45) to (323, 220).
; PLAN: r0=377(x1), r1=45(y1), r2=323(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 45
LDI r2, 323
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
