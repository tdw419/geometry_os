; DESCRIPTION: Composite: Sets a single purple pixel at (430, 193) then Places a black circle of radius 39 at center (434, 47) then Places a white line segment connecting (312, 66) to (86, 74).
; PLAN: r0=430(x), r1=193(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=47(y), r7=39(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=312(x1), r11=66(y1), r12=86(x2), r13=74(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 193
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 47
LDI r7, 39
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 312
LDI r11, 66
LDI r12, 86
LDI r13, 74
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
