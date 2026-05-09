; DESCRIPTION: Composite: Draws a magenta circle centered at (189, 65) with radius 25 then Places a red dot at position (80, 248) then Places a magenta line segment connecting (347, 9) to (174, 71).
; PLAN: r0=189(x), r1=65(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x), r6=248(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=347(x1), r11=9(y1), r12=174(x2), r13=71(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 65
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 248
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 347
LDI r11, 9
LDI r12, 174
LDI r13, 71
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
