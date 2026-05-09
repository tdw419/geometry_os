; DESCRIPTION: Composite: Creates a blue circular shape at (409, 48) with radius 35 then Draws a yellow line from (452, 41) to (147, 165) then Sets a single white pixel at (27, 248).
; PLAN: r0=409(x), r1=48(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=452(x1), r6=41(y1), r7=147(x2), r8=165(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=27(x), r11=248(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 48
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 452
LDI r6, 41
LDI r7, 147
LDI r8, 165
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 248
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
