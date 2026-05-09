; DESCRIPTION: Composite: Sets a single blue pixel at (65, 96) then Creates a black circular shape at (350, 135) with radius 80 then Renders a purple box of size 90x89 starting at (52, 138).
; PLAN: r0=65(x), r1=96(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=135(y), r7=80(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=52(x), r11=138(y), r12=90(width), r13=89(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 96
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 350
LDI r6, 135
LDI r7, 80
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 52
LDI r11, 138
LDI r12, 90
LDI r13, 89
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
