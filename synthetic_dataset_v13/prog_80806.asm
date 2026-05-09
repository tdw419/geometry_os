; DESCRIPTION: Places a yellow line segment connecting (400, 150) to (296, 77).
; PLAN: r0=400(x1), r1=150(y1), r2=296(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 150
LDI r2, 296
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
