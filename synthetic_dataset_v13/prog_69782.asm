; DESCRIPTION: Places a red line segment connecting (343, 46) to (335, 225).
; PLAN: r0=343(x1), r1=46(y1), r2=335(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 46
LDI r2, 335
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
