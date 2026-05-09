; DESCRIPTION: Composite: Sets a single white pixel at (34, 225) then Draws a cyan line from (378, 255) to (23, 77) then Creates a cyan circular shape at (156, 101) with radius 57.
; PLAN: r0=34(x), r1=225(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=378(x1), r6=255(y1), r7=23(x2), r8=77(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=156(x), r11=101(y), r12=57(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 34
LDI r1, 225
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 255
LDI r7, 23
LDI r8, 77
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 101
LDI r12, 57
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
