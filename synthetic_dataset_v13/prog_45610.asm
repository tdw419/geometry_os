; DESCRIPTION: Composite: Draws a orange circle centered at (200, 98) with radius 37 then Sets a single red pixel at (212, 112) then Places a red line segment connecting (66, 82) to (213, 48).
; PLAN: r0=200(x), r1=98(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x), r6=112(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=66(x1), r11=82(y1), r12=213(x2), r13=48(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 98
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 112
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 66
LDI r11, 82
LDI r12, 213
LDI r13, 48
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
