; DESCRIPTION: Composite: Sets a single cyan pixel at (251, 248) then Creates a purple circular shape at (328, 81) with radius 61 then Renders a orange line between points (320, 216) and (62, 36).
; PLAN: r0=251(x), r1=248(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=81(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=320(x1), r11=216(y1), r12=62(x2), r13=36(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 248
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 81
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 320
LDI r11, 216
LDI r12, 62
LDI r13, 36
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
