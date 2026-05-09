; DESCRIPTION: Composite: Renders a red disk with center (129, 145) and radius 53 then Sets a single black pixel at (278, 31) then Renders a purple box of size 95x41 starting at (2, 71).
; PLAN: r0=129(x), r1=145(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=31(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=2(x), r11=71(y), r12=95(width), r13=41(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 145
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 31
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 2
LDI r11, 71
LDI r12, 95
LDI r13, 41
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
