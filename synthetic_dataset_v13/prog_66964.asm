; DESCRIPTION: Composite: Renders a white disk with center (484, 92) and radius 25 then Places a yellow dot at position (149, 66) then Places a green line segment connecting (81, 99) to (500, 89).
; PLAN: r0=484(x), r1=92(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x), r6=66(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=81(x1), r11=99(y1), r12=500(x2), r13=89(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 92
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 66
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 81
LDI r11, 99
LDI r12, 500
LDI r13, 89
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
