; DESCRIPTION: Places a black line segment connecting (302, 190) to (293, 37).
; PLAN: r0=302(x1), r1=190(y1), r2=293(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 190
LDI r2, 293
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
