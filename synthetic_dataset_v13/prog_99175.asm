; DESCRIPTION: Places a black line segment connecting (106, 214) to (324, 21).
; PLAN: r0=106(x1), r1=214(y1), r2=324(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 214
LDI r2, 324
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
