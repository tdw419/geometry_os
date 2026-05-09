; DESCRIPTION: Composite: Draws a blue circle centered at (199, 144) with radius 61 then Draws a magenta line from (177, 216) to (500, 126) then Sets a single red pixel at (497, 127).
; PLAN: r0=199(x), r1=144(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x1), r6=216(y1), r7=500(x2), r8=126(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=497(x), r11=127(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 144
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 216
LDI r7, 500
LDI r8, 126
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 127
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
