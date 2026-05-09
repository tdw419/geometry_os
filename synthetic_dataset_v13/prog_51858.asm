; DESCRIPTION: Places a yellow line segment connecting (41, 177) to (223, 60).
; PLAN: r0=41(x1), r1=177(y1), r2=223(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 177
LDI r2, 223
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
