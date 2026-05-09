; DESCRIPTION: Composite: Sets a single yellow pixel at (114, 217) then Creates a purple circular shape at (112, 140) with radius 17 then Places a cyan 55x34 rectangle at position (398, 175).
; PLAN: r0=114(x), r1=217(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=140(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=398(x), r11=175(y), r12=55(width), r13=34(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 217
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 112
LDI r6, 140
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 398
LDI r11, 175
LDI r12, 55
LDI r13, 34
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
