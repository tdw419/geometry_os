; DESCRIPTION: Composite: Draws a cyan circle centered at (165, 102) with radius 41 then Places a purple line segment connecting (472, 46) to (42, 209) then Sets a single white pixel at (500, 100).
; PLAN: r0=165(x), r1=102(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x1), r6=46(y1), r7=42(x2), r8=209(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=500(x), r11=100(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 165
LDI r1, 102
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 46
LDI r7, 42
LDI r8, 209
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 500
LDI r11, 100
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
