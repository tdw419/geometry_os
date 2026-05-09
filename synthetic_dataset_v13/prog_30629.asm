; DESCRIPTION: Composite: Sets a single orange pixel at (127, 120) then Places a orange line segment connecting (182, 138) to (465, 143) then Draws a cyan circle centered at (93, 198) with radius 12.
; PLAN: r0=127(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=182(x1), r6=138(y1), r7=465(x2), r8=143(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=93(x), r11=198(y), r12=12(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 127
LDI r1, 120
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 182
LDI r6, 138
LDI r7, 465
LDI r8, 143
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 198
LDI r12, 12
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
