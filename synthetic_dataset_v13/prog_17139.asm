; DESCRIPTION: Places a black line segment connecting (285, 208) to (211, 70).
; PLAN: r0=285(x1), r1=208(y1), r2=211(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 208
LDI r2, 211
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
