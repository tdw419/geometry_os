; DESCRIPTION: Composite: Sets a single green pixel at (374, 203) then Places a white line segment connecting (446, 83) to (433, 251) then Creates a green circular shape at (289, 224) with radius 27.
; PLAN: r0=374(x), r1=203(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=446(x1), r6=83(y1), r7=433(x2), r8=251(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=224(y), r12=27(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 374
LDI r1, 203
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 446
LDI r6, 83
LDI r7, 433
LDI r8, 251
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 224
LDI r12, 27
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
