; DESCRIPTION: Composite: Places a purple 69x98 rectangle at position (106, 53) then Renders a red disk with center (276, 193) and radius 49 then Places a black line segment connecting (458, 159) to (217, 156).
; PLAN: r0=106(x), r1=53(y), r2=69(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=193(y), r7=49(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=458(x1), r11=159(y1), r12=217(x2), r13=156(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 53
LDI r2, 69
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 193
LDI r7, 49
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 458
LDI r11, 159
LDI r12, 217
LDI r13, 156
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
