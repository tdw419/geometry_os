; DESCRIPTION: Places a white line segment connecting (118, 150) to (252, 17).
; PLAN: r0=118(x1), r1=150(y1), r2=252(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 150
LDI r2, 252
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
