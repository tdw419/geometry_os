; DESCRIPTION: Composite: Places a yellow line segment connecting (426, 164) to (335, 190) then Creates a blue circular shape at (312, 23) with radius 18 then Sets a single blue pixel at (284, 127).
; PLAN: r0=426(x1), r1=164(y1), r2=335(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=23(y), r7=18(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=127(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 164
LDI r2, 335
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 23
LDI r7, 18
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 127
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
