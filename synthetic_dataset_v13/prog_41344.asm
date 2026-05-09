; DESCRIPTION: Composite: Draws a black circle centered at (180, 216) with radius 32 then Renders a yellow line between points (334, 159) and (486, 69) then Sets a single green pixel at (102, 71).
; PLAN: r0=180(x), r1=216(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x1), r6=159(y1), r7=486(x2), r8=69(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=102(x), r11=71(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 180
LDI r1, 216
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 159
LDI r7, 486
LDI r8, 69
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 71
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
