; DESCRIPTION: Composite: Renders a yellow line between points (234, 12) and (164, 9) then Places a yellow circle of radius 49 at center (339, 106).
; PLAN: r0=234(x1), r1=12(y1), r2=164(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=106(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 234
LDI r1, 12
LDI r2, 164
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 106
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
