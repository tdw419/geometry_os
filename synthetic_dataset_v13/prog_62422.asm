; DESCRIPTION: Composite: Renders a magenta disk with center (69, 233) and radius 16 then Sets a single magenta pixel at (36, 189) then Places a orange line segment connecting (297, 144) to (373, 68).
; PLAN: r0=69(x), r1=233(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x), r6=189(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=297(x1), r11=144(y1), r12=373(x2), r13=68(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 233
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 189
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 297
LDI r11, 144
LDI r12, 373
LDI r13, 68
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
