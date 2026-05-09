; DESCRIPTION: Composite: Sets a single orange pixel at (325, 62) then Draws a blue circle centered at (47, 107) with radius 17 then Renders a green line between points (246, 190) and (143, 248).
; PLAN: r0=325(x), r1=62(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=47(x), r6=107(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=246(x1), r11=190(y1), r12=143(x2), r13=248(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 62
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 47
LDI r6, 107
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 246
LDI r11, 190
LDI r12, 143
LDI r13, 248
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
