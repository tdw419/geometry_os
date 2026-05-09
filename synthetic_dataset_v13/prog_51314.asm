; DESCRIPTION: Composite: Creates a red rectangular region at (334, 214) spanning 76 by 10 pixels then Renders a green disk with center (196, 99) and radius 15 then Sets a single red pixel at (498, 139).
; PLAN: r0=334(x), r1=214(y), r2=76(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=196(x), r6=99(y), r7=15(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x), r11=139(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 334
LDI r1, 214
LDI r2, 76
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 99
LDI r7, 15
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 139
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
