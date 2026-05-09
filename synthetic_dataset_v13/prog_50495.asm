; DESCRIPTION: Composite: Draws a cyan circle centered at (399, 172) with radius 77 then Renders a yellow box of size 79x66 starting at (135, 94) then Sets a single orange pixel at (363, 147).
; PLAN: r0=399(x), r1=172(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=94(y), r7=79(width), r8=66(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=363(x), r11=147(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 399
LDI r1, 172
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 94
LDI r7, 79
LDI r8, 66
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 147
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
