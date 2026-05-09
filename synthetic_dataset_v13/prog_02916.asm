; DESCRIPTION: Composite: Renders a red disk with center (382, 58) and radius 34 then Places a orange dot at position (207, 216) then Places a yellow line segment connecting (449, 104) to (27, 172).
; PLAN: r0=382(x), r1=58(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=216(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=449(x1), r11=104(y1), r12=27(x2), r13=172(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 58
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 216
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 449
LDI r11, 104
LDI r12, 27
LDI r13, 172
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
