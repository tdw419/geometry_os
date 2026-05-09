; DESCRIPTION: Places a black line segment connecting (508, 82) to (77, 218).
; PLAN: r0=508(x1), r1=82(y1), r2=77(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 82
LDI r2, 77
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
