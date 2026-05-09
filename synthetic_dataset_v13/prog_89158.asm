; DESCRIPTION: Composite: Draws a magenta line from (359, 18) to (53, 56) then Creates a red circular shape at (91, 47) with radius 31 then Sets a single purple pixel at (297, 129).
; PLAN: r0=359(x1), r1=18(y1), r2=53(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=47(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=297(x), r11=129(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 359
LDI r1, 18
LDI r2, 53
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 47
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 297
LDI r11, 129
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
