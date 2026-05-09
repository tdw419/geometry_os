; DESCRIPTION: Places a black line segment connecting (94, 135) to (431, 202).
; PLAN: r0=94(x1), r1=135(y1), r2=431(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 135
LDI r2, 431
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
