; DESCRIPTION: Composite: Creates a orange circular shape at (345, 92) with radius 52 then Places a purple line segment connecting (197, 0) to (154, 94) then Sets a single blue pixel at (193, 250).
; PLAN: r0=345(x), r1=92(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x1), r6=0(y1), r7=154(x2), r8=94(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=193(x), r11=250(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 345
LDI r1, 92
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 0
LDI r7, 154
LDI r8, 94
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 250
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
