; DESCRIPTION: Composite: Places a green line segment connecting (293, 126) to (74, 61) then Sets a single blue pixel at (174, 255) then Renders a magenta disk with center (157, 150) and radius 79.
; PLAN: r0=293(x1), r1=126(y1), r2=74(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=255(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=157(x), r11=150(y), r12=79(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 293
LDI r1, 126
LDI r2, 74
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 255
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 157
LDI r11, 150
LDI r12, 79
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
