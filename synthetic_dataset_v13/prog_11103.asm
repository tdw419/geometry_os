; DESCRIPTION: Composite: Renders a yellow disk with center (259, 138) and radius 28 then Places a orange line segment connecting (161, 74) to (270, 124) then Sets a single orange pixel at (302, 158).
; PLAN: r0=259(x), r1=138(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x1), r6=74(y1), r7=270(x2), r8=124(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=158(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 259
LDI r1, 138
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 74
LDI r7, 270
LDI r8, 124
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 158
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
