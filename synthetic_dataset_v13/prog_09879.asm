; DESCRIPTION: Composite: Places a magenta line segment connecting (437, 208) to (226, 212) then Creates a magenta circular shape at (267, 154) with radius 22 then Sets a single red pixel at (165, 143).
; PLAN: r0=437(x1), r1=208(y1), r2=226(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=154(y), r7=22(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=165(x), r11=143(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 437
LDI r1, 208
LDI r2, 226
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 154
LDI r7, 22
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 165
LDI r11, 143
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
