; DESCRIPTION: Composite: Renders a red disk with center (270, 138) and radius 24 then Sets a single yellow pixel at (54, 241) then Places a white line segment connecting (32, 54) to (381, 183).
; PLAN: r0=270(x), r1=138(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=241(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=32(x1), r11=54(y1), r12=381(x2), r13=183(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 138
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 241
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 32
LDI r11, 54
LDI r12, 381
LDI r13, 183
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
