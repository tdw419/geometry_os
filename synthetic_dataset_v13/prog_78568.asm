; DESCRIPTION: Composite: Sets a single black pixel at (53, 191) then Places a cyan circle of radius 57 at center (88, 176) then Places a orange line segment connecting (435, 19) to (44, 83).
; PLAN: r0=53(x), r1=191(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=176(y), r7=57(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=435(x1), r11=19(y1), r12=44(x2), r13=83(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 191
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 88
LDI r6, 176
LDI r7, 57
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 435
LDI r11, 19
LDI r12, 44
LDI r13, 83
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
