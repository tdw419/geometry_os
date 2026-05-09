; DESCRIPTION: Composite: Places a yellow line segment connecting (161, 159) to (258, 55) then Creates a yellow circular shape at (226, 213) with radius 40 then Sets a single purple pixel at (328, 154).
; PLAN: r0=161(x1), r1=159(y1), r2=258(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=213(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=328(x), r11=154(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 161
LDI r1, 159
LDI r2, 258
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 213
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 328
LDI r11, 154
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
