; DESCRIPTION: Composite: Sets a single white pixel at (200, 37) then Draws a green line from (225, 255) to (285, 10) then Places a yellow circle of radius 32 at center (427, 71).
; PLAN: r0=200(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=225(x1), r6=255(y1), r7=285(x2), r8=10(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=427(x), r11=71(y), r12=32(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 200
LDI r1, 37
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 225
LDI r6, 255
LDI r7, 285
LDI r8, 10
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 71
LDI r12, 32
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
