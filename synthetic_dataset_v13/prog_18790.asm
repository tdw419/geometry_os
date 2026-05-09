; DESCRIPTION: Composite: Renders a yellow disk with center (274, 158) and radius 20 then Sets a single magenta pixel at (41, 64) then Places a purple 75x90 rectangle at position (84, 47).
; PLAN: r0=274(x), r1=158(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=64(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=84(x), r11=47(y), r12=75(width), r13=90(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 158
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 64
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 84
LDI r11, 47
LDI r12, 75
LDI r13, 90
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
