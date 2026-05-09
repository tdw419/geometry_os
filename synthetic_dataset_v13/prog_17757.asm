; DESCRIPTION: Composite: Creates a black rectangular region at (266, 12) spanning 39 by 87 pixels then Creates a yellow circular shape at (462, 93) with radius 13 then Sets a single orange pixel at (345, 255).
; PLAN: r0=266(x), r1=12(y), r2=39(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x), r6=93(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=345(x), r11=255(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 12
LDI r2, 39
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 93
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 345
LDI r11, 255
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
