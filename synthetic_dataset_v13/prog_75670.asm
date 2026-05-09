; DESCRIPTION: Composite: Creates a yellow rectangular region at (4, 78) spanning 96 by 19 pixels then Creates a cyan circular shape at (284, 211) with radius 21 then Sets a single white pixel at (305, 193).
; PLAN: r0=4(x), r1=78(y), r2=96(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=211(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=305(x), r11=193(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 4
LDI r1, 78
LDI r2, 96
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 211
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 305
LDI r11, 193
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
