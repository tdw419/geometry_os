; DESCRIPTION: Places a black line segment connecting (420, 211) to (335, 14).
; PLAN: r0=420(x1), r1=211(y1), r2=335(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 211
LDI r2, 335
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
