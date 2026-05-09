; DESCRIPTION: Composite: Renders a orange line between points (471, 101) and (64, 215) then Renders a green disk with center (429, 56) and radius 40 then Sets a single blue pixel at (225, 125).
; PLAN: r0=471(x1), r1=101(y1), r2=64(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=56(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=225(x), r11=125(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 471
LDI r1, 101
LDI r2, 64
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 56
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 225
LDI r11, 125
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
