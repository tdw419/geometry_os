; DESCRIPTION: Composite: Places a magenta line segment connecting (345, 237) to (486, 183) then Draws a magenta circle centered at (127, 49) with radius 33 then Sets a single yellow pixel at (79, 143).
; PLAN: r0=345(x1), r1=237(y1), r2=486(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=49(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x), r11=143(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 345
LDI r1, 237
LDI r2, 486
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 49
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 143
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
