; DESCRIPTION: Composite: Renders a orange disk with center (249, 40) and radius 30 then Places a yellow dot at position (193, 201) then Places a green line segment connecting (6, 111) to (226, 1).
; PLAN: r0=249(x), r1=40(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=201(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=6(x1), r11=111(y1), r12=226(x2), r13=1(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 40
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 201
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 6
LDI r11, 111
LDI r12, 226
LDI r13, 1
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
