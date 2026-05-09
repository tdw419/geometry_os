; DESCRIPTION: Composite: Places a red line segment connecting (260, 233) to (388, 222) then Creates a green circular shape at (418, 152) with radius 58 then Places a white dot at position (349, 248).
; PLAN: r0=260(x1), r1=233(y1), r2=388(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=152(y), r7=58(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=349(x), r11=248(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 260
LDI r1, 233
LDI r2, 388
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 152
LDI r7, 58
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 349
LDI r11, 248
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
