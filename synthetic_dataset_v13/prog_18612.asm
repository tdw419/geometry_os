; DESCRIPTION: Composite: Places a black circle of radius 46 at center (116, 199) then Places a cyan line segment connecting (125, 58) to (383, 43) then Places a purple dot at position (40, 96).
; PLAN: r0=116(x), r1=199(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x1), r6=58(y1), r7=383(x2), r8=43(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=40(x), r11=96(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 199
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 58
LDI r7, 383
LDI r8, 43
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 96
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
