; DESCRIPTION: Composite: Places a green line segment connecting (405, 55) to (335, 93) then Sets a single green pixel at (96, 169).
; PLAN: r0=405(x1), r1=55(y1), r2=335(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=169(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 405
LDI r1, 55
LDI r2, 335
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 169
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
