; DESCRIPTION: Places a black line segment connecting (83, 8) to (303, 69).
; PLAN: r0=83(x1), r1=8(y1), r2=303(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 8
LDI r2, 303
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
