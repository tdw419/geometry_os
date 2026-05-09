; DESCRIPTION: Composite: Places a orange circle of radius 10 at center (268, 130) then Sets a single yellow pixel at (493, 24) then Places a yellow line segment connecting (238, 201) to (469, 117).
; PLAN: r0=268(x), r1=130(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=493(x), r6=24(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=238(x1), r11=201(y1), r12=469(x2), r13=117(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 130
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 493
LDI r6, 24
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 238
LDI r11, 201
LDI r12, 469
LDI r13, 117
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
