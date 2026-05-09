; DESCRIPTION: Places a black line segment connecting (429, 14) to (416, 2).
; PLAN: r0=429(x1), r1=14(y1), r2=416(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 14
LDI r2, 416
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
