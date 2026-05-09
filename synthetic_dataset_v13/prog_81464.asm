; DESCRIPTION: Places a black line segment connecting (21, 8) to (69, 80).
; PLAN: r0=21(x1), r1=8(y1), r2=69(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 8
LDI r2, 69
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
