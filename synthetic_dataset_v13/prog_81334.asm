; DESCRIPTION: Composite: Sets a single yellow pixel at (136, 204) then Creates a red circular shape at (269, 99) with radius 31 then Renders a green line between points (85, 208) and (415, 138).
; PLAN: r0=136(x), r1=204(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=99(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=85(x1), r11=208(y1), r12=415(x2), r13=138(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 204
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 269
LDI r6, 99
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 85
LDI r11, 208
LDI r12, 415
LDI r13, 138
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
