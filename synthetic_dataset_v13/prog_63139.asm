; DESCRIPTION: Composite: Renders a black disk with center (318, 84) and radius 80 then Places a red dot at position (298, 211) then Places a black line segment connecting (84, 79) to (307, 225).
; PLAN: r0=318(x), r1=84(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=211(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=84(x1), r11=79(y1), r12=307(x2), r13=225(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 84
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 211
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 84
LDI r11, 79
LDI r12, 307
LDI r13, 225
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
