; DESCRIPTION: Composite: Places a red line segment connecting (317, 225) to (495, 130) then Sets a single purple pixel at (408, 211) then Draws a magenta circle centered at (215, 194) with radius 46.
; PLAN: r0=317(x1), r1=225(y1), r2=495(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=408(x), r6=211(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=194(y), r12=46(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 317
LDI r1, 225
LDI r2, 495
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 211
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 194
LDI r12, 46
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
