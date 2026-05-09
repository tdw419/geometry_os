; DESCRIPTION: Composite: Renders a black disk with center (94, 170) and radius 38 then Places a yellow line segment connecting (329, 239) to (440, 35) then Sets a single black pixel at (409, 234).
; PLAN: r0=94(x), r1=170(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x1), r6=239(y1), r7=440(x2), r8=35(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=234(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 94
LDI r1, 170
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 239
LDI r7, 440
LDI r8, 35
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 234
LDI r12, 0x000000
PSET r10, r11, r12
HALT
