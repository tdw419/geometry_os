; DESCRIPTION: Composite: Draws a purple circle centered at (424, 132) with radius 55 then Places a cyan line segment connecting (478, 184) to (99, 203).
; PLAN: r0=424(x), r1=132(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x1), r6=184(y1), r7=99(x2), r8=203(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 132
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 184
LDI r7, 99
LDI r8, 203
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
