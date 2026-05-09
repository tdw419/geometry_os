; DESCRIPTION: Composite: Renders a black box of size 55x40 starting at (262, 139) then Renders a red disk with center (184, 75) and radius 53 then Sets a single red pixel at (402, 122).
; PLAN: r0=262(x), r1=139(y), r2=55(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=75(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=402(x), r11=122(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 262
LDI r1, 139
LDI r2, 55
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 75
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 402
LDI r11, 122
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
