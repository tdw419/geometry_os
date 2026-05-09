; DESCRIPTION: Composite: Draws a green circle centered at (232, 76) with radius 28 then Places a white line segment connecting (237, 185) to (248, 98) then Sets a single cyan pixel at (269, 224).
; PLAN: r0=232(x), r1=76(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x1), r6=185(y1), r7=248(x2), r8=98(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=269(x), r11=224(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 76
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 185
LDI r7, 248
LDI r8, 98
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 224
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
