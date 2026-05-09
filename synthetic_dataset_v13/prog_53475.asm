; DESCRIPTION: Composite: Creates a purple circular shape at (329, 72) with radius 62 then Places a blue dot at position (131, 154) then Places a magenta line segment connecting (201, 194) to (409, 131).
; PLAN: r0=329(x), r1=72(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x), r6=154(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=201(x1), r11=194(y1), r12=409(x2), r13=131(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 72
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 154
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 201
LDI r11, 194
LDI r12, 409
LDI r13, 131
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
