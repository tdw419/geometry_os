; DESCRIPTION: Composite: Renders a red line between points (160, 212) and (129, 34) then Places a cyan circle of radius 37 at center (254, 92) then Sets a single cyan pixel at (246, 145).
; PLAN: r0=160(x1), r1=212(y1), r2=129(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=92(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=246(x), r11=145(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 160
LDI r1, 212
LDI r2, 129
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 92
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 246
LDI r11, 145
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
