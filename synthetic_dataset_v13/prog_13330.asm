; DESCRIPTION: Composite: Sets a single red pixel at (354, 20) then Renders a purple disk with center (253, 137) and radius 56 then Renders a yellow line between points (365, 243) and (315, 111).
; PLAN: r0=354(x), r1=20(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=253(x), r6=137(y), r7=56(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=365(x1), r11=243(y1), r12=315(x2), r13=111(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 20
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 253
LDI r6, 137
LDI r7, 56
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 365
LDI r11, 243
LDI r12, 315
LDI r13, 111
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
