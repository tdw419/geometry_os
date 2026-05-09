; DESCRIPTION: Places a white line segment connecting (321, 247) to (212, 110).
; PLAN: r0=321(x1), r1=247(y1), r2=212(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 247
LDI r2, 212
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
