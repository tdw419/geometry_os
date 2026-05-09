; DESCRIPTION: Composite: Sets a single red pixel at (285, 0) then Draws a red line from (37, 150) to (150, 202) then Creates a cyan circular shape at (419, 190) with radius 11.
; PLAN: r0=285(x), r1=0(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=37(x1), r6=150(y1), r7=150(x2), r8=202(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=419(x), r11=190(y), r12=11(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 0
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 37
LDI r6, 150
LDI r7, 150
LDI r8, 202
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 190
LDI r12, 11
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
