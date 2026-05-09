; DESCRIPTION: Composite: Draws a cyan circle centered at (121, 182) with radius 19 then Places a black line segment connecting (193, 103) to (509, 158) then Places a yellow dot at position (189, 72).
; PLAN: r0=121(x), r1=182(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x1), r6=103(y1), r7=509(x2), r8=158(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=72(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 121
LDI r1, 182
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 103
LDI r7, 509
LDI r8, 158
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 72
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
