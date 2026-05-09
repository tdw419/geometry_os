; DESCRIPTION: Composite: Places a red dot at position (385, 98) then Renders a blue disk with center (150, 148) and radius 40 then Places a black line segment connecting (186, 144) to (245, 13).
; PLAN: r0=385(x), r1=98(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=150(x), r6=148(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=186(x1), r11=144(y1), r12=245(x2), r13=13(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 98
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 150
LDI r6, 148
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 186
LDI r11, 144
LDI r12, 245
LDI r13, 13
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
