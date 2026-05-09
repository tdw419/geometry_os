; DESCRIPTION: Places a black line segment connecting (35, 74) to (9, 49).
; PLAN: r0=35(x1), r1=74(y1), r2=9(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 74
LDI r2, 9
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
