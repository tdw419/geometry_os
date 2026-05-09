; DESCRIPTION: Composite: Places a blue circle of radius 48 at center (275, 186) then Places a magenta line segment connecting (70, 48) to (128, 224) then Sets a single green pixel at (41, 49).
; PLAN: r0=275(x), r1=186(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x1), r6=48(y1), r7=128(x2), r8=224(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=41(x), r11=49(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 275
LDI r1, 186
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 48
LDI r7, 128
LDI r8, 224
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 41
LDI r11, 49
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
