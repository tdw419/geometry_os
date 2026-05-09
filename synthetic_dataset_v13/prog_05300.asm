; DESCRIPTION: Composite: Places a red line segment connecting (441, 109) to (480, 232) then Sets a single cyan pixel at (268, 129).
; PLAN: r0=441(x1), r1=109(y1), r2=480(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=129(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 441
LDI r1, 109
LDI r2, 480
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 129
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
