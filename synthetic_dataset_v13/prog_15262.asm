; DESCRIPTION: Composite: Creates a yellow circular shape at (461, 217) with radius 25 then Renders a black line between points (287, 56) and (234, 200) then Sets a single white pixel at (479, 129).
; PLAN: r0=461(x), r1=217(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x1), r6=56(y1), r7=234(x2), r8=200(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=479(x), r11=129(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 461
LDI r1, 217
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 56
LDI r7, 234
LDI r8, 200
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 129
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
