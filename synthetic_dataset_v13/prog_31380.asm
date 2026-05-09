; DESCRIPTION: Composite: Places a green circle of radius 34 at center (340, 82) then Sets a single white pixel at (193, 253) then Places a yellow 40x72 rectangle at position (220, 129).
; PLAN: r0=340(x), r1=82(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=253(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=220(x), r11=129(y), r12=40(width), r13=72(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 82
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 253
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 220
LDI r11, 129
LDI r12, 40
LDI r13, 72
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
