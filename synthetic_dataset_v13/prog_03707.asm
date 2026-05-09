; DESCRIPTION: Composite: Renders a green disk with center (250, 175) and radius 21 then Places a cyan line segment connecting (373, 57) to (376, 115) then Places a orange dot at position (325, 100).
; PLAN: r0=250(x), r1=175(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x1), r6=57(y1), r7=376(x2), r8=115(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=100(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 250
LDI r1, 175
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 57
LDI r7, 376
LDI r8, 115
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 100
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
