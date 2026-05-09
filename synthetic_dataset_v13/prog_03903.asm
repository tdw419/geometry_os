; DESCRIPTION: Composite: Renders a green box of size 35x75 starting at (239, 114) then Places a black circle of radius 27 at center (447, 90) then Sets a single white pixel at (188, 91).
; PLAN: r0=239(x), r1=114(y), r2=35(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=90(y), r7=27(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=188(x), r11=91(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 239
LDI r1, 114
LDI r2, 35
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 90
LDI r7, 27
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 188
LDI r11, 91
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
