; DESCRIPTION: Composite: Creates a purple circular shape at (326, 78) with radius 28 then Places a yellow dot at position (48, 66) then Places a orange line segment connecting (18, 19) to (269, 165).
; PLAN: r0=326(x), r1=78(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=66(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=18(x1), r11=19(y1), r12=269(x2), r13=165(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 78
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 66
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 18
LDI r11, 19
LDI r12, 269
LDI r13, 165
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
