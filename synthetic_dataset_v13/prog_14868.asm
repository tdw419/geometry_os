; DESCRIPTION: Composite: Places a yellow line segment connecting (506, 5) to (465, 17) then Renders a yellow disk with center (369, 195) and radius 56 then Places a white dot at position (24, 107).
; PLAN: r0=506(x1), r1=5(y1), r2=465(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=195(y), r7=56(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x), r11=107(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 506
LDI r1, 5
LDI r2, 465
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 195
LDI r7, 56
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 107
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
