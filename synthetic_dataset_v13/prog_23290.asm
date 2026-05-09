; DESCRIPTION: Composite: Renders a red disk with center (316, 170) and radius 10 then Renders a orange line between points (19, 35) and (254, 203) then Places a magenta dot at position (58, 220).
; PLAN: r0=316(x), r1=170(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x1), r6=35(y1), r7=254(x2), r8=203(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=58(x), r11=220(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 316
LDI r1, 170
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 35
LDI r7, 254
LDI r8, 203
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 220
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
