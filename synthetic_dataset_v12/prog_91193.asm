; DESCRIPTION: Composite: Places a red dot at position (501, 174) then Creates a orange circular shape at (233, 177) with radius 62 then Places a yellow line segment connecting (222, 169) to (217, 241).
; PLAN: r0=501(x), r1=174(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=233(x), r6=177(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=222(x1), r11=169(y1), r12=217(x2), r13=241(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 501
LDI r1, 174
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 233
LDI r6, 177
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 222
LDI r11, 169
LDI r12, 217
LDI r13, 241
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
