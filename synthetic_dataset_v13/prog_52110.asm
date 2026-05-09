; DESCRIPTION: Composite: Places a red circle of radius 18 at center (318, 107) then Sets a single white pixel at (48, 104) then Places a magenta line segment connecting (66, 95) to (443, 172).
; PLAN: r0=318(x), r1=107(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=104(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=66(x1), r11=95(y1), r12=443(x2), r13=172(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 107
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 104
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 66
LDI r11, 95
LDI r12, 443
LDI r13, 172
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
