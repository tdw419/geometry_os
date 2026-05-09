; DESCRIPTION: Composite: Draws a black circle centered at (377, 212) with radius 17 then Places a yellow line segment connecting (334, 13) to (41, 151) then Places a magenta dot at position (341, 16).
; PLAN: r0=377(x), r1=212(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x1), r6=13(y1), r7=41(x2), r8=151(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=16(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 377
LDI r1, 212
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 13
LDI r7, 41
LDI r8, 151
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 16
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
