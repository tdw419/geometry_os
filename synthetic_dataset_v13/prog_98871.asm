; DESCRIPTION: Composite: Sets a single red pixel at (127, 21) then Creates a yellow circular shape at (335, 147) with radius 42 then Draws a green line from (138, 251) to (127, 175).
; PLAN: r0=127(x), r1=21(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=147(y), r7=42(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=138(x1), r11=251(y1), r12=127(x2), r13=175(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 21
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 335
LDI r6, 147
LDI r7, 42
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 138
LDI r11, 251
LDI r12, 127
LDI r13, 175
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
