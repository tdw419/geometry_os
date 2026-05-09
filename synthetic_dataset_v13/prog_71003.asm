; DESCRIPTION: Places a white line segment connecting (230, 52) to (489, 141).
; PLAN: r0=230(x1), r1=52(y1), r2=489(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 52
LDI r2, 489
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
