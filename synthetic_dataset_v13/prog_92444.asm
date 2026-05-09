; DESCRIPTION: Composite: Renders a white line between points (47, 128) and (286, 189) then Creates a orange circular shape at (90, 103) with radius 78 then Sets a single blue pixel at (167, 242).
; PLAN: r0=47(x1), r1=128(y1), r2=286(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=103(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=167(x), r11=242(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 47
LDI r1, 128
LDI r2, 286
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 103
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 167
LDI r11, 242
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
