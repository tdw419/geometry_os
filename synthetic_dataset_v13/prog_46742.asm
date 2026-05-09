; DESCRIPTION: Composite: Creates a cyan circular shape at (77, 142) with radius 68 then Draws a orange line from (310, 84) to (206, 147) then Sets a single orange pixel at (367, 123).
; PLAN: r0=77(x), r1=142(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x1), r6=84(y1), r7=206(x2), r8=147(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=367(x), r11=123(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 77
LDI r1, 142
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 84
LDI r7, 206
LDI r8, 147
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 123
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
