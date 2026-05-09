; DESCRIPTION: Composite: Places a cyan line segment connecting (342, 176) to (417, 130) then Renders a black disk with center (461, 123) and radius 40 then Sets a single purple pixel at (213, 81).
; PLAN: r0=342(x1), r1=176(y1), r2=417(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=461(x), r6=123(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=213(x), r11=81(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 176
LDI r2, 417
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 123
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 213
LDI r11, 81
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
