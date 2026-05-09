; DESCRIPTION: Places a black line segment connecting (302, 234) to (264, 13).
; PLAN: r0=302(x1), r1=234(y1), r2=264(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 234
LDI r2, 264
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
