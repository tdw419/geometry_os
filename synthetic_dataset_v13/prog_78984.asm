; DESCRIPTION: Composite: Draws a purple circle centered at (371, 198) with radius 46 then Places a purple line segment connecting (249, 0) to (20, 204) then Places a white dot at position (473, 156).
; PLAN: r0=371(x), r1=198(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x1), r6=0(y1), r7=20(x2), r8=204(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=473(x), r11=156(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 198
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 0
LDI r7, 20
LDI r8, 204
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 473
LDI r11, 156
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
