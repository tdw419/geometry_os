; DESCRIPTION: Composite: Places a magenta line segment connecting (253, 202) to (309, 218) then Places a blue dot at position (373, 242) then Places a orange circle of radius 65 at center (103, 171).
; PLAN: r0=253(x1), r1=202(y1), r2=309(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=242(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=103(x), r11=171(y), r12=65(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 253
LDI r1, 202
LDI r2, 309
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 242
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 103
LDI r11, 171
LDI r12, 65
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
