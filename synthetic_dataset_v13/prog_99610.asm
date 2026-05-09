; DESCRIPTION: Composite: Creates a purple circular shape at (167, 83) with radius 72 then Sets a single purple pixel at (430, 31) then Renders a orange line between points (284, 205) and (422, 212).
; PLAN: r0=167(x), r1=83(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=31(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=284(x1), r11=205(y1), r12=422(x2), r13=212(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 83
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 31
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 284
LDI r11, 205
LDI r12, 422
LDI r13, 212
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
