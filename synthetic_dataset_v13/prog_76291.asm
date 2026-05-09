; DESCRIPTION: Composite: Places a black line segment connecting (450, 0) to (435, 224) then Places a purple circle of radius 27 at center (270, 62) then Sets a single magenta pixel at (488, 227).
; PLAN: r0=450(x1), r1=0(y1), r2=435(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=62(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=488(x), r11=227(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 450
LDI r1, 0
LDI r2, 435
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 62
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 488
LDI r11, 227
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
