; DESCRIPTION: Composite: Draws a cyan line from (408, 3) to (285, 165) then Sets a single cyan pixel at (82, 8) then Creates a yellow circular shape at (114, 52) with radius 33.
; PLAN: r0=408(x1), r1=3(y1), r2=285(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=8(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=114(x), r11=52(y), r12=33(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 408
LDI r1, 3
LDI r2, 285
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 8
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 114
LDI r11, 52
LDI r12, 33
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
