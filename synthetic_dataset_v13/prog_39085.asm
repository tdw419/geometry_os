; DESCRIPTION: Composite: Renders a cyan disk with center (257, 99) and radius 71 then Places a blue line segment connecting (7, 252) to (66, 183) then Sets a single black pixel at (222, 116).
; PLAN: r0=257(x), r1=99(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x1), r6=252(y1), r7=66(x2), r8=183(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=222(x), r11=116(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 99
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 252
LDI r7, 66
LDI r8, 183
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 116
LDI r12, 0x000000
PSET r10, r11, r12
HALT
