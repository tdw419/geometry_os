; DESCRIPTION: Composite: Renders a green disk with center (72, 134) and radius 39 then Places a yellow line segment connecting (421, 93) to (476, 238) then Sets a single cyan pixel at (129, 175).
; PLAN: r0=72(x), r1=134(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x1), r6=93(y1), r7=476(x2), r8=238(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=175(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 72
LDI r1, 134
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 93
LDI r7, 476
LDI r8, 238
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 175
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
