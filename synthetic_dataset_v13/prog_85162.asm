; DESCRIPTION: Places a black line segment connecting (236, 236) to (236, 4).
; PLAN: r0=236(x1), r1=236(y1), r2=236(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 236
LDI r2, 236
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
