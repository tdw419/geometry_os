; DESCRIPTION: Composite: Creates a purple rectangular region at (373, 137) spanning 112 by 11 pixels then Places a white line segment connecting (148, 219) to (154, 216) then Places a black circle of radius 64 at center (437, 131).
; PLAN: r0=373(x), r1=137(y), r2=112(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x1), r6=219(y1), r7=154(x2), r8=216(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=437(x), r11=131(y), r12=64(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 137
LDI r2, 112
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 219
LDI r7, 154
LDI r8, 216
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 131
LDI r12, 64
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
