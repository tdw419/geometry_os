; DESCRIPTION: Composite: Renders a orange disk with center (389, 134) and radius 78 then Renders a cyan line between points (450, 64) and (461, 128) then Sets a single blue pixel at (253, 184).
; PLAN: r0=389(x), r1=134(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x1), r6=64(y1), r7=461(x2), r8=128(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=184(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 134
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 64
LDI r7, 461
LDI r8, 128
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 184
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
