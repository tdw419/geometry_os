; DESCRIPTION: Composite: Places a white line segment connecting (38, 12) to (90, 155) then Sets a single red pixel at (294, 23).
; PLAN: r0=38(x1), r1=12(y1), r2=90(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=23(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 38
LDI r1, 12
LDI r2, 90
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 23
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
