; DESCRIPTION: Composite: Renders a cyan line between points (414, 163) and (425, 46) then Creates a blue circular shape at (264, 94) with radius 68 then Sets a single purple pixel at (233, 139).
; PLAN: r0=414(x1), r1=163(y1), r2=425(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=94(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=233(x), r11=139(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 414
LDI r1, 163
LDI r2, 425
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 94
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 233
LDI r11, 139
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
