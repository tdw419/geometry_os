; DESCRIPTION: Composite: Renders a yellow box of size 37x86 starting at (341, 144) then Places a yellow circle of radius 18 at center (164, 126) then Sets a single red pixel at (328, 145).
; PLAN: r0=341(x), r1=144(y), r2=37(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=126(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=328(x), r11=145(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 341
LDI r1, 144
LDI r2, 37
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 126
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 328
LDI r11, 145
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
