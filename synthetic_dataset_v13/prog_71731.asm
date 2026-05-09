; DESCRIPTION: Composite: Sets a single orange pixel at (185, 24) then Renders a magenta disk with center (74, 170) and radius 52 then Renders a purple box of size 17x94 starting at (181, 0).
; PLAN: r0=185(x), r1=24(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=170(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=181(x), r11=0(y), r12=17(width), r13=94(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 24
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 74
LDI r6, 170
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 181
LDI r11, 0
LDI r12, 17
LDI r13, 94
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
