; DESCRIPTION: Composite: Places a red dot at position (84, 137) then Places a purple circle of radius 19 at center (343, 56) then Places a cyan line segment connecting (458, 233) to (175, 139).
; PLAN: r0=84(x), r1=137(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=343(x), r6=56(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=458(x1), r11=233(y1), r12=175(x2), r13=139(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 137
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 343
LDI r6, 56
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 458
LDI r11, 233
LDI r12, 175
LDI r13, 139
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
