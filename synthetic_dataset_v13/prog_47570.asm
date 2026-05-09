; DESCRIPTION: Places a green line segment connecting (190, 61) to (286, 149).
; PLAN: r0=190(x1), r1=61(y1), r2=286(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 61
LDI r2, 286
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
