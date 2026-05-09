; DESCRIPTION: Places a black line segment connecting (98, 22) to (398, 22).
; PLAN: r0=98(x1), r1=22(y1), r2=398(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 22
LDI r2, 398
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
