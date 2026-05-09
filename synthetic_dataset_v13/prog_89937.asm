; DESCRIPTION: Composite: Places a yellow line segment connecting (287, 111) to (37, 31) then Places a yellow dot at position (10, 174) then Renders a purple disk with center (333, 196) and radius 19.
; PLAN: r0=287(x1), r1=111(y1), r2=37(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=174(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=333(x), r11=196(y), r12=19(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 111
LDI r2, 37
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 174
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 333
LDI r11, 196
LDI r12, 19
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
