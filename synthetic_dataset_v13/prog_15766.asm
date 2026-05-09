; DESCRIPTION: Draws a green line from (350, 70) to (314, 89).
; PLAN: r0=350(x1), r1=70(y1), r2=314(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 70
LDI r2, 314
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
