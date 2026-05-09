; DESCRIPTION: Composite: Places a blue line segment connecting (244, 154) to (241, 182) then Places a red circle of radius 33 at center (245, 124) then Sets a single green pixel at (56, 93).
; PLAN: r0=244(x1), r1=154(y1), r2=241(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=124(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=56(x), r11=93(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 154
LDI r2, 241
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 124
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 56
LDI r11, 93
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
