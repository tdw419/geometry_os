; DESCRIPTION: Places a white line segment connecting (193, 76) to (335, 143).
; PLAN: r0=193(x1), r1=76(y1), r2=335(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 76
LDI r2, 335
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
