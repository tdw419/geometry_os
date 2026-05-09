; DESCRIPTION: Composite: Creates a orange circular shape at (312, 122) with radius 54 then Draws a white line from (274, 205) to (337, 85) then Sets a single blue pixel at (347, 150).
; PLAN: r0=312(x), r1=122(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x1), r6=205(y1), r7=337(x2), r8=85(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=150(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 122
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 205
LDI r7, 337
LDI r8, 85
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 150
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
