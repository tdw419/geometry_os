; DESCRIPTION: Composite: Places a red line segment connecting (351, 108) to (290, 131) then Places a magenta dot at position (248, 61).
; PLAN: r0=351(x1), r1=108(y1), r2=290(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=61(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 351
LDI r1, 108
LDI r2, 290
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 61
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
