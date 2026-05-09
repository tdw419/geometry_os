; DESCRIPTION: Composite: Sets a single white pixel at (316, 154) then Creates a red circular shape at (155, 113) with radius 70 then Draws a green line from (268, 65) to (276, 98).
; PLAN: r0=316(x), r1=154(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=113(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=268(x1), r11=65(y1), r12=276(x2), r13=98(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 154
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 155
LDI r6, 113
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 268
LDI r11, 65
LDI r12, 276
LDI r13, 98
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
