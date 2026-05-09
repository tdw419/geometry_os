; DESCRIPTION: Composite: Places a white dot at position (357, 219) then Draws a yellow line from (147, 7) to (308, 63) then Creates a cyan circular shape at (394, 95) with radius 66.
; PLAN: r0=357(x), r1=219(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=147(x1), r6=7(y1), r7=308(x2), r8=63(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=394(x), r11=95(y), r12=66(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 357
LDI r1, 219
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 147
LDI r6, 7
LDI r7, 308
LDI r8, 63
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 95
LDI r12, 66
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
