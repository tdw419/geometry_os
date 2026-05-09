; DESCRIPTION: Places a green line segment connecting (424, 25) to (41, 65).
; PLAN: r0=424(x1), r1=25(y1), r2=41(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 25
LDI r2, 41
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
