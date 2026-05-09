; DESCRIPTION: Composite: Sets a single green pixel at (478, 129) then Renders a red line between points (93, 170) and (309, 103) then Places a black circle of radius 46 at center (233, 46).
; PLAN: r0=478(x), r1=129(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=93(x1), r6=170(y1), r7=309(x2), r8=103(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=46(y), r12=46(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 478
LDI r1, 129
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 93
LDI r6, 170
LDI r7, 309
LDI r8, 103
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 46
LDI r12, 46
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
