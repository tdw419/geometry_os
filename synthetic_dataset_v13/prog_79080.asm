; DESCRIPTION: Composite: Renders a purple disk with center (234, 104) and radius 77 then Places a purple dot at position (54, 219) then Places a orange line segment connecting (510, 130) to (354, 172).
; PLAN: r0=234(x), r1=104(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=219(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=510(x1), r11=130(y1), r12=354(x2), r13=172(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 104
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 219
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 510
LDI r11, 130
LDI r12, 354
LDI r13, 172
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
