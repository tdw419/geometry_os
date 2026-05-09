; DESCRIPTION: Composite: Draws a red circle centered at (184, 115) with radius 71 then Places a white line segment connecting (321, 245) to (37, 147) then Sets a single green pixel at (0, 111).
; PLAN: r0=184(x), r1=115(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x1), r6=245(y1), r7=37(x2), r8=147(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=0(x), r11=111(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 115
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 245
LDI r7, 37
LDI r8, 147
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 0
LDI r11, 111
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
