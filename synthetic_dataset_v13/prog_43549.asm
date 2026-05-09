; DESCRIPTION: Places a black line segment connecting (401, 147) to (80, 70).
; PLAN: r0=401(x1), r1=147(y1), r2=80(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 147
LDI r2, 80
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
