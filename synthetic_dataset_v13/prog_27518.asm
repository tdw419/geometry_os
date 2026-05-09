; DESCRIPTION: Composite: Places a black line segment connecting (75, 182) to (231, 192) then Draws a cyan circle centered at (402, 167) with radius 64 then Sets a single green pixel at (268, 74).
; PLAN: r0=75(x1), r1=182(y1), r2=231(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=167(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=268(x), r11=74(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 75
LDI r1, 182
LDI r2, 231
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 167
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 268
LDI r11, 74
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
