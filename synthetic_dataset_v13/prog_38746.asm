; DESCRIPTION: Places a black line segment connecting (305, 99) to (391, 169).
; PLAN: r0=305(x1), r1=99(y1), r2=391(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 99
LDI r2, 391
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
