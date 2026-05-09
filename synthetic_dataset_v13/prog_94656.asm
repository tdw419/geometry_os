; DESCRIPTION: Composite: Creates a black circular shape at (374, 201) with radius 29 then Places a orange dot at position (132, 183) then Renders a green line between points (92, 39) and (78, 134).
; PLAN: r0=374(x), r1=201(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=183(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=92(x1), r11=39(y1), r12=78(x2), r13=134(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 201
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 183
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 92
LDI r11, 39
LDI r12, 78
LDI r13, 134
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
