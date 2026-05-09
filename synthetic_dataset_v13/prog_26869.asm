; DESCRIPTION: Composite: Places a red line segment connecting (279, 216) to (127, 190) then Draws a black circle centered at (164, 96) with radius 66 then Sets a single black pixel at (340, 234).
; PLAN: r0=279(x1), r1=216(y1), r2=127(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=96(y), r7=66(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=340(x), r11=234(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 279
LDI r1, 216
LDI r2, 127
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 96
LDI r7, 66
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 340
LDI r11, 234
LDI r12, 0x000000
PSET r10, r11, r12
HALT
