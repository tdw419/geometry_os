; DESCRIPTION: Draws a blue line from (13, 91) to (83, 89).
; PLAN: r0=13(x1), r1=91(y1), r2=83(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 91
LDI r2, 83
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
