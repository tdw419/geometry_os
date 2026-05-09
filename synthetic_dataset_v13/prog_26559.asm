; DESCRIPTION: Places a red line segment connecting (417, 41) to (230, 129).
; PLAN: r0=417(x1), r1=41(y1), r2=230(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 41
LDI r2, 230
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
