; DESCRIPTION: Composite: Sets a single cyan pixel at (226, 232) then Places a yellow line segment connecting (358, 57) to (255, 141) then Creates a yellow circular shape at (201, 152) with radius 60.
; PLAN: r0=226(x), r1=232(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=358(x1), r6=57(y1), r7=255(x2), r8=141(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=201(x), r11=152(y), r12=60(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 226
LDI r1, 232
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 57
LDI r7, 255
LDI r8, 141
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 152
LDI r12, 60
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
