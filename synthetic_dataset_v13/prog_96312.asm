; DESCRIPTION: Composite: Renders a blue box of size 85x57 starting at (232, 125) then Sets a single magenta pixel at (511, 201) then Places a black circle of radius 28 at center (435, 52).
; PLAN: r0=232(x), r1=125(y), r2=85(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x), r6=201(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=435(x), r11=52(y), r12=28(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 232
LDI r1, 125
LDI r2, 85
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 201
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 435
LDI r11, 52
LDI r12, 28
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
