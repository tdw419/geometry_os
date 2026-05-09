; DESCRIPTION: Composite: Draws a yellow circle centered at (277, 89) with radius 52 then Places a yellow dot at position (126, 38) then Draws a yellow line from (430, 139) to (222, 106).
; PLAN: r0=277(x), r1=89(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=38(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=430(x1), r11=139(y1), r12=222(x2), r13=106(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 89
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 38
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 430
LDI r11, 139
LDI r12, 222
LDI r13, 106
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
