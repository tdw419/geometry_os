; DESCRIPTION: Composite: Renders a magenta disk with center (190, 97) and radius 38 then Places a magenta line segment connecting (506, 246) to (180, 11) then Sets a single orange pixel at (490, 133).
; PLAN: r0=190(x), r1=97(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=506(x1), r6=246(y1), r7=180(x2), r8=11(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=490(x), r11=133(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 97
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 506
LDI r6, 246
LDI r7, 180
LDI r8, 11
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 490
LDI r11, 133
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
