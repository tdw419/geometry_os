; DESCRIPTION: Composite: Renders a green line between points (478, 25) and (348, 138) then Draws a yellow circle centered at (206, 176) with radius 53 then Sets a single orange pixel at (187, 97).
; PLAN: r0=478(x1), r1=25(y1), r2=348(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=176(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x), r11=97(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 478
LDI r1, 25
LDI r2, 348
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 176
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 97
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
