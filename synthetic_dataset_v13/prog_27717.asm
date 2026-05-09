; DESCRIPTION: Composite: Places a white dot at position (2, 125) then Places a purple circle of radius 29 at center (279, 214) then Renders a yellow box of size 82x17 starting at (373, 53).
; PLAN: r0=2(x), r1=125(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=279(x), r6=214(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x), r11=53(y), r12=82(width), r13=17(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 125
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 214
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 53
LDI r12, 82
LDI r13, 17
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
