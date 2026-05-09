; DESCRIPTION: Places a black line segment connecting (68, 96) to (423, 5).
; PLAN: r0=68(x1), r1=96(y1), r2=423(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 96
LDI r2, 423
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
