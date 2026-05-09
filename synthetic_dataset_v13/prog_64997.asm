; DESCRIPTION: Places a black line segment connecting (15, 74) to (305, 119).
; PLAN: r0=15(x1), r1=74(y1), r2=305(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 74
LDI r2, 305
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
