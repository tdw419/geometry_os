; DESCRIPTION: Composite: Renders a blue box of size 91x20 starting at (316, 228) then Draws a white circle centered at (242, 84) with radius 31 then Sets a single cyan pixel at (310, 78).
; PLAN: r0=316(x), r1=228(y), r2=91(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=84(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=310(x), r11=78(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 316
LDI r1, 228
LDI r2, 91
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 84
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 310
LDI r11, 78
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
