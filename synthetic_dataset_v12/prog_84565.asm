; DESCRIPTION: Places a black line segment connecting (295, 122) to (302, 45).
; PLAN: r0=295(x1), r1=122(y1), r2=302(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 122
LDI r2, 302
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
