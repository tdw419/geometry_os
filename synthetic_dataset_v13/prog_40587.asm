; DESCRIPTION: Places a black line segment connecting (106, 236) to (272, 20).
; PLAN: r0=106(x1), r1=236(y1), r2=272(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 236
LDI r2, 272
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
