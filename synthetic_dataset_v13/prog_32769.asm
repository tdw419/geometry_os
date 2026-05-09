; DESCRIPTION: Composite: Draws a red circle centered at (132, 33) with radius 26 then Places a green line segment connecting (411, 100) to (291, 40) then Sets a single white pixel at (194, 189).
; PLAN: r0=132(x), r1=33(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x1), r6=100(y1), r7=291(x2), r8=40(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=189(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 33
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 100
LDI r7, 291
LDI r8, 40
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 189
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
