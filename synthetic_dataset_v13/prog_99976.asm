; DESCRIPTION: Composite: Places a black circle of radius 21 at center (169, 47) then Places a purple dot at position (373, 25) then Places a black 41x91 rectangle at position (302, 25).
; PLAN: r0=169(x), r1=47(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x), r6=25(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=302(x), r11=25(y), r12=41(width), r13=91(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 47
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 25
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 302
LDI r11, 25
LDI r12, 41
LDI r13, 91
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
