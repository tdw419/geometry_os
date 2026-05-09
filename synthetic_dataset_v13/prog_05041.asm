; DESCRIPTION: Composite: Renders a red disk with center (416, 106) and radius 50 then Places a magenta line segment connecting (477, 11) to (50, 218) then Sets a single purple pixel at (355, 48).
; PLAN: r0=416(x), r1=106(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x1), r6=11(y1), r7=50(x2), r8=218(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=355(x), r11=48(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 106
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 11
LDI r7, 50
LDI r8, 218
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 48
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
