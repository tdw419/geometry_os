; DESCRIPTION: Places a black line segment connecting (180, 141) to (399, 102).
; PLAN: r0=180(x1), r1=141(y1), r2=399(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 141
LDI r2, 399
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
