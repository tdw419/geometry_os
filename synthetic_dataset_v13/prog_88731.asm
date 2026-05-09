; DESCRIPTION: Composite: Sets a single orange pixel at (155, 152) then Renders a cyan line between points (467, 1) and (437, 207) then Draws a black circle centered at (331, 139) with radius 73.
; PLAN: r0=155(x), r1=152(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=467(x1), r6=1(y1), r7=437(x2), r8=207(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=331(x), r11=139(y), r12=73(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 155
LDI r1, 152
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 467
LDI r6, 1
LDI r7, 437
LDI r8, 207
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 139
LDI r12, 73
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
