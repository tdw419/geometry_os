; DESCRIPTION: Composite: Draws a red line from (372, 92) to (412, 91) then Sets a single red pixel at (497, 91) then Places a green circle of radius 24 at center (190, 81).
; PLAN: r0=372(x1), r1=92(y1), r2=412(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=497(x), r6=91(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=190(x), r11=81(y), r12=24(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 372
LDI r1, 92
LDI r2, 412
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 91
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 190
LDI r11, 81
LDI r12, 24
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
