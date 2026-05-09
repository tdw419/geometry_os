; DESCRIPTION: Composite: Draws a yellow line from (463, 169) to (78, 211) then Draws a orange rectangle at (406, 225) with width 95 and height 10 then Sets a single blue pixel at (319, 177).
; PLAN: r0=463(x1), r1=169(y1), r2=78(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=225(y), r7=95(width), r8=10(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=177(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 463
LDI r1, 169
LDI r2, 78
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 225
LDI r7, 95
LDI r8, 10
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 177
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
