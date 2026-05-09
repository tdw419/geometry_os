; DESCRIPTION: Composite: Sets a single orange pixel at (177, 91) then Places a yellow circle of radius 76 at center (197, 178) then Renders a yellow line between points (124, 122) and (54, 67).
; PLAN: r0=177(x), r1=91(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=178(y), r7=76(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=124(x1), r11=122(y1), r12=54(x2), r13=67(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 91
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 197
LDI r6, 178
LDI r7, 76
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 124
LDI r11, 122
LDI r12, 54
LDI r13, 67
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
