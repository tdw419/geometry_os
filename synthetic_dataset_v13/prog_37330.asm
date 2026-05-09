; DESCRIPTION: Composite: Creates a black circular shape at (370, 64) with radius 29 then Sets a single orange pixel at (353, 63) then Places a purple line segment connecting (56, 168) to (63, 204).
; PLAN: r0=370(x), r1=64(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=63(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=56(x1), r11=168(y1), r12=63(x2), r13=204(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 64
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 63
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 56
LDI r11, 168
LDI r12, 63
LDI r13, 204
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
