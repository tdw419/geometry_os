; DESCRIPTION: Places a black line segment connecting (326, 22) to (20, 120).
; PLAN: r0=326(x1), r1=22(y1), r2=20(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 22
LDI r2, 20
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
