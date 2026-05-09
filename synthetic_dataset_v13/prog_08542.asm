; DESCRIPTION: Composite: Sets a single green pixel at (511, 54) then Renders a purple line between points (505, 47) and (192, 23) then Creates a cyan circular shape at (440, 205) with radius 29.
; PLAN: r0=511(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=505(x1), r6=47(y1), r7=192(x2), r8=23(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=440(x), r11=205(y), r12=29(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 511
LDI r1, 54
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 505
LDI r6, 47
LDI r7, 192
LDI r8, 23
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 205
LDI r12, 29
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
