; DESCRIPTION: Composite: Renders a yellow disk with center (182, 134) and radius 71 then Sets a single green pixel at (189, 145) then Places a purple 65x40 rectangle at position (354, 11).
; PLAN: r0=182(x), r1=134(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x), r6=145(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=354(x), r11=11(y), r12=65(width), r13=40(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 134
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 145
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 354
LDI r11, 11
LDI r12, 65
LDI r13, 40
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
