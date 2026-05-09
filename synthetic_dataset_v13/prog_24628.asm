; DESCRIPTION: Composite: Sets a single black pixel at (429, 123) then Places a yellow circle of radius 19 at center (99, 148) then Places a red line segment connecting (179, 7) to (242, 240).
; PLAN: r0=429(x), r1=123(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=148(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=179(x1), r11=7(y1), r12=242(x2), r13=240(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 123
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 99
LDI r6, 148
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 179
LDI r11, 7
LDI r12, 242
LDI r13, 240
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
