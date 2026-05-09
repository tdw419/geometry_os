; DESCRIPTION: Places a black line segment connecting (489, 138) to (178, 54).
; PLAN: r0=489(x1), r1=138(y1), r2=178(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 138
LDI r2, 178
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
