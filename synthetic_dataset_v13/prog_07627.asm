; DESCRIPTION: Composite: Renders a cyan disk with center (312, 159) and radius 49 then Draws a cyan line from (411, 108) to (402, 94) then Sets a single white pixel at (378, 32).
; PLAN: r0=312(x), r1=159(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x1), r6=108(y1), r7=402(x2), r8=94(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=32(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 159
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 108
LDI r7, 402
LDI r8, 94
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 32
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
