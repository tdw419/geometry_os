; DESCRIPTION: Composite: Creates a green circular shape at (188, 162) with radius 33 then Places a red line segment connecting (321, 209) to (451, 249) then Sets a single orange pixel at (280, 49).
; PLAN: r0=188(x), r1=162(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x1), r6=209(y1), r7=451(x2), r8=249(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=49(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 188
LDI r1, 162
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 209
LDI r7, 451
LDI r8, 249
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 49
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
