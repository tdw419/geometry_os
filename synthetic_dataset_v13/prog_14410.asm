; DESCRIPTION: Composite: Creates a orange rectangular region at (242, 36) spanning 120 by 33 pixels then Draws a blue circle centered at (372, 78) with radius 64 then Sets a single green pixel at (370, 163).
; PLAN: r0=242(x), r1=36(y), r2=120(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=78(y), r7=64(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x), r11=163(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 242
LDI r1, 36
LDI r2, 120
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 78
LDI r7, 64
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 163
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
