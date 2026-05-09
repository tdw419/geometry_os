; DESCRIPTION: Composite: Draws a cyan line from (144, 219) to (405, 137) then Creates a yellow circular shape at (102, 164) with radius 62 then Sets a single cyan pixel at (439, 229).
; PLAN: r0=144(x1), r1=219(y1), r2=405(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=164(y), r7=62(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=439(x), r11=229(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 144
LDI r1, 219
LDI r2, 405
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 164
LDI r7, 62
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 439
LDI r11, 229
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
