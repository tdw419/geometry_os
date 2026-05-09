; DESCRIPTION: Composite: Renders a magenta disk with center (349, 136) and radius 66 then Places a orange line segment connecting (321, 189) to (280, 158) then Places a purple dot at position (284, 49).
; PLAN: r0=349(x), r1=136(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x1), r6=189(y1), r7=280(x2), r8=158(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=284(x), r11=49(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 349
LDI r1, 136
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 189
LDI r7, 280
LDI r8, 158
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 49
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
