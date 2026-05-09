; DESCRIPTION: Composite: Draws a orange circle centered at (253, 149) with radius 65 then Renders a green line between points (30, 149) and (268, 19) then Sets a single white pixel at (339, 153).
; PLAN: r0=253(x), r1=149(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x1), r6=149(y1), r7=268(x2), r8=19(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=339(x), r11=153(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 253
LDI r1, 149
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 149
LDI r7, 268
LDI r8, 19
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 153
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
