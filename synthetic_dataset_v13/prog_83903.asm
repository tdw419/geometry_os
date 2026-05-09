; DESCRIPTION: Places a black line segment connecting (44, 180) to (25, 9).
; PLAN: r0=44(x1), r1=180(y1), r2=25(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 180
LDI r2, 25
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
