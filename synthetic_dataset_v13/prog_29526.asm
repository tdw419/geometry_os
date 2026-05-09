; DESCRIPTION: Composite: Creates a yellow circular shape at (349, 159) with radius 53 then Places a green dot at position (438, 39) then Renders a yellow line between points (94, 43) and (19, 165).
; PLAN: r0=349(x), r1=159(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x), r6=39(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=94(x1), r11=43(y1), r12=19(x2), r13=165(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 159
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 39
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 94
LDI r11, 43
LDI r12, 19
LDI r13, 165
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
