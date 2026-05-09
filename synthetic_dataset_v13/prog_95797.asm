; DESCRIPTION: Composite: Renders a orange line between points (116, 250) and (95, 27) then Renders a yellow disk with center (228, 173) and radius 60 then Sets a single blue pixel at (376, 111).
; PLAN: r0=116(x1), r1=250(y1), r2=95(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=228(x), r6=173(y), r7=60(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x), r11=111(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 250
LDI r2, 95
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 173
LDI r7, 60
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 111
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
