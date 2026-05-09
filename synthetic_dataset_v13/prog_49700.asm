; DESCRIPTION: Composite: Renders a purple box of size 11x88 starting at (140, 129) then Renders a red disk with center (359, 151) and radius 33 then Sets a single blue pixel at (454, 199).
; PLAN: r0=140(x), r1=129(y), r2=11(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x), r6=151(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=454(x), r11=199(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 140
LDI r1, 129
LDI r2, 11
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 151
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 454
LDI r11, 199
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
