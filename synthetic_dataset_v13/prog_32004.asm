; DESCRIPTION: Composite: Draws a white line from (268, 93) to (264, 208) then Creates a green rectangular region at (269, 11) spanning 81 by 110 pixels then Sets a single black pixel at (137, 128).
; PLAN: r0=268(x1), r1=93(y1), r2=264(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=11(y), r7=81(width), r8=110(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=137(x), r11=128(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 268
LDI r1, 93
LDI r2, 264
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 11
LDI r7, 81
LDI r8, 110
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 128
LDI r12, 0x000000
PSET r10, r11, r12
HALT
