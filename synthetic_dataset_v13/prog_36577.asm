; DESCRIPTION: Composite: Sets a single yellow pixel at (349, 12) then Places a yellow line segment connecting (380, 64) to (407, 85) then Draws a black circle centered at (91, 223) with radius 26.
; PLAN: r0=349(x), r1=12(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=380(x1), r6=64(y1), r7=407(x2), r8=85(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=91(x), r11=223(y), r12=26(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 349
LDI r1, 12
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 380
LDI r6, 64
LDI r7, 407
LDI r8, 85
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 223
LDI r12, 26
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
