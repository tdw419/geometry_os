; DESCRIPTION: Places a black line segment connecting (77, 20) to (424, 180).
; PLAN: r0=77(x1), r1=20(y1), r2=424(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 20
LDI r2, 424
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
