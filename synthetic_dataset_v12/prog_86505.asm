; DESCRIPTION: Composite: Renders a purple box of size 90x105 starting at (234, 56) then Creates a white circular shape at (99, 80) with radius 51 then Sets a single red pixel at (228, 23).
; PLAN: r0=234(x), r1=56(y), r2=90(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=80(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=228(x), r11=23(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 234
LDI r1, 56
LDI r2, 90
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 80
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 228
LDI r11, 23
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
