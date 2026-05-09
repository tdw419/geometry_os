; DESCRIPTION: Composite: Draws a yellow circle centered at (217, 142) with radius 65 then Places a white dot at position (169, 242) then Places a green line segment connecting (233, 185) to (257, 247).
; PLAN: r0=217(x), r1=142(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x), r6=242(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=233(x1), r11=185(y1), r12=257(x2), r13=247(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 142
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 242
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 233
LDI r11, 185
LDI r12, 257
LDI r13, 247
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
