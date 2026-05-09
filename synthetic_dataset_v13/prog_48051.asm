; DESCRIPTION: Places a black line segment connecting (303, 71) to (462, 211).
; PLAN: r0=303(x1), r1=71(y1), r2=462(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 71
LDI r2, 462
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
