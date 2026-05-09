; DESCRIPTION: Composite: Creates a black circular shape at (280, 53) with radius 45 then Places a purple line segment connecting (340, 214) to (140, 4).
; PLAN: r0=280(x), r1=53(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x1), r6=214(y1), r7=140(x2), r8=4(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 53
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 214
LDI r7, 140
LDI r8, 4
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
