; DESCRIPTION: Composite: Places a yellow line segment connecting (483, 131) to (504, 186) then Places a red circle of radius 63 at center (444, 154) then Places a white dot at position (458, 164).
; PLAN: r0=483(x1), r1=131(y1), r2=504(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=154(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=458(x), r11=164(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 483
LDI r1, 131
LDI r2, 504
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 154
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 458
LDI r11, 164
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
