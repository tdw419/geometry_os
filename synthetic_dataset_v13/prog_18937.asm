; DESCRIPTION: Composite: Places a black circle of radius 46 at center (294, 144) then Places a red line segment connecting (81, 36) to (206, 161) then Sets a single blue pixel at (385, 203).
; PLAN: r0=294(x), r1=144(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x1), r6=36(y1), r7=206(x2), r8=161(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=385(x), r11=203(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 144
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 36
LDI r7, 206
LDI r8, 161
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 203
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
