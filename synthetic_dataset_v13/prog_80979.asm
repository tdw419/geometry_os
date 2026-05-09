; DESCRIPTION: Places a black line segment connecting (139, 55) to (277, 45).
; PLAN: r0=139(x1), r1=55(y1), r2=277(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 55
LDI r2, 277
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
