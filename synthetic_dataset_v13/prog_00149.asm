; DESCRIPTION: Places a blue line segment connecting (342, 213) to (83, 229).
; PLAN: r0=342(x1), r1=213(y1), r2=83(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 213
LDI r2, 83
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
