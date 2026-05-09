; DESCRIPTION: Composite: Draws a black line from (443, 216) to (71, 203) then Sets a single black pixel at (70, 11) then Places a yellow circle of radius 67 at center (291, 109).
; PLAN: r0=443(x1), r1=216(y1), r2=71(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=11(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=291(x), r11=109(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 443
LDI r1, 216
LDI r2, 71
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 11
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 291
LDI r11, 109
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
