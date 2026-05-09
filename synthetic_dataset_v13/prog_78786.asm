; DESCRIPTION: Composite: Renders a purple disk with center (97, 217) and radius 17 then Places a red dot at position (166, 140) then Places a white line segment connecting (405, 242) to (505, 70).
; PLAN: r0=97(x), r1=217(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=140(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=405(x1), r11=242(y1), r12=505(x2), r13=70(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 217
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 140
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 405
LDI r11, 242
LDI r12, 505
LDI r13, 70
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
