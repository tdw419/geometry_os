; DESCRIPTION: Places a white line segment connecting (389, 60) to (83, 242).
; PLAN: r0=389(x1), r1=60(y1), r2=83(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 60
LDI r2, 83
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
