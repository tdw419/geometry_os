; DESCRIPTION: Composite: Renders a blue box of size 119x65 starting at (214, 137) then Sets a single purple pixel at (458, 136) then Places a blue circle of radius 54 at center (379, 69).
; PLAN: r0=214(x), r1=137(y), r2=119(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x), r6=136(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=379(x), r11=69(y), r12=54(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 137
LDI r2, 119
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 136
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 379
LDI r11, 69
LDI r12, 54
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
