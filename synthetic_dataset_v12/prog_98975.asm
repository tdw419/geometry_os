; DESCRIPTION: Places a green line segment connecting (108, 41) to (448, 71).
; PLAN: r0=108(x1), r1=41(y1), r2=448(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 41
LDI r2, 448
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
