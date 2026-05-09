; DESCRIPTION: Composite: Places a purple dot at position (15, 111) then Creates a cyan circular shape at (351, 169) with radius 64 then Renders a yellow line between points (374, 134) and (100, 54).
; PLAN: r0=15(x), r1=111(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=169(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x1), r11=134(y1), r12=100(x2), r13=54(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 111
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 351
LDI r6, 169
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 134
LDI r12, 100
LDI r13, 54
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
