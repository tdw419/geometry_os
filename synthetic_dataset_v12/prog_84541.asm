; DESCRIPTION: Places a black line segment connecting (148, 161) to (114, 14).
; PLAN: r0=148(x1), r1=161(y1), r2=114(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 161
LDI r2, 114
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
