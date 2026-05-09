; DESCRIPTION: Places a black line segment connecting (388, 117) to (500, 180).
; PLAN: r0=388(x1), r1=117(y1), r2=500(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 117
LDI r2, 500
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
