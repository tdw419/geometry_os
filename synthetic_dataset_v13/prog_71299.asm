; DESCRIPTION: Composite: Places a magenta circle of radius 62 at center (329, 191) then Sets a single white pixel at (126, 242) then Places a black line segment connecting (173, 147) to (334, 42).
; PLAN: r0=329(x), r1=191(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=242(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=173(x1), r11=147(y1), r12=334(x2), r13=42(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 191
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 242
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 173
LDI r11, 147
LDI r12, 334
LDI r13, 42
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
