; DESCRIPTION: Composite: Creates a green rectangular region at (459, 18) spanning 24 by 78 pixels then Renders a purple disk with center (156, 99) and radius 55 then Sets a single cyan pixel at (321, 207).
; PLAN: r0=459(x), r1=18(y), r2=24(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=99(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=321(x), r11=207(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 459
LDI r1, 18
LDI r2, 24
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 99
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 321
LDI r11, 207
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
