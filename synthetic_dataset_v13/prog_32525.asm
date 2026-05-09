; DESCRIPTION: Composite: Draws a black circle centered at (89, 187) with radius 39 then Places a magenta line segment connecting (426, 157) to (374, 53) then Sets a single green pixel at (312, 40).
; PLAN: r0=89(x), r1=187(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x1), r6=157(y1), r7=374(x2), r8=53(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=312(x), r11=40(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 89
LDI r1, 187
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 157
LDI r7, 374
LDI r8, 53
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 40
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
