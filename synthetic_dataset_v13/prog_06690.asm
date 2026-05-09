; DESCRIPTION: Composite: Draws a purple circle centered at (211, 51) with radius 46 then Places a orange line segment connecting (98, 176) to (213, 102).
; PLAN: r0=211(x), r1=51(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x1), r6=176(y1), r7=213(x2), r8=102(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 51
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 176
LDI r7, 213
LDI r8, 102
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
