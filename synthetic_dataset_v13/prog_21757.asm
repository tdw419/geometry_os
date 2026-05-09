; DESCRIPTION: Composite: Places a black circle of radius 70 at center (159, 165) then Places a black line segment connecting (47, 25) to (113, 190) then Sets a single orange pixel at (150, 10).
; PLAN: r0=159(x), r1=165(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x1), r6=25(y1), r7=113(x2), r8=190(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=10(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 165
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 25
LDI r7, 113
LDI r8, 190
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 10
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
