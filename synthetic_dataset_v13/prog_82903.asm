; DESCRIPTION: Composite: Draws a black circle centered at (166, 133) with radius 68 then Draws a orange line from (209, 251) to (368, 27) then Sets a single yellow pixel at (459, 176).
; PLAN: r0=166(x), r1=133(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x1), r6=251(y1), r7=368(x2), r8=27(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=459(x), r11=176(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 166
LDI r1, 133
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 251
LDI r7, 368
LDI r8, 27
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 176
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
