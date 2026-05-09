; DESCRIPTION: Composite: Draws a red circle centered at (204, 98) with radius 69 then Places a green line segment connecting (395, 246) to (191, 30) then Sets a single white pixel at (314, 247).
; PLAN: r0=204(x), r1=98(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x1), r6=246(y1), r7=191(x2), r8=30(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=247(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 98
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 246
LDI r7, 191
LDI r8, 30
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 247
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
