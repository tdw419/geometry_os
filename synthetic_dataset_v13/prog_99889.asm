; DESCRIPTION: Composite: Creates a yellow circular shape at (272, 165) with radius 54 then Draws a yellow line from (321, 171) to (124, 159) then Sets a single red pixel at (154, 11).
; PLAN: r0=272(x), r1=165(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x1), r6=171(y1), r7=124(x2), r8=159(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=154(x), r11=11(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 165
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 171
LDI r7, 124
LDI r8, 159
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 11
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
