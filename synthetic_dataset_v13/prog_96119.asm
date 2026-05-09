; DESCRIPTION: Places a black line segment connecting (22, 45) to (180, 254).
; PLAN: r0=22(x1), r1=45(y1), r2=180(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 45
LDI r2, 180
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
