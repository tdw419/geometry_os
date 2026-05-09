; DESCRIPTION: Composite: Sets a single purple pixel at (18, 184) then Draws a cyan line from (473, 18) to (150, 114) then Creates a yellow circular shape at (430, 175) with radius 51.
; PLAN: r0=18(x), r1=184(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=473(x1), r6=18(y1), r7=150(x2), r8=114(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=430(x), r11=175(y), r12=51(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 18
LDI r1, 184
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 473
LDI r6, 18
LDI r7, 150
LDI r8, 114
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 175
LDI r12, 51
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
