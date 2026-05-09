; DESCRIPTION: Composite: Places a cyan circle of radius 17 at center (250, 110) then Renders a white box of size 103x55 starting at (112, 98) then Sets a single blue pixel at (473, 75).
; PLAN: r0=250(x), r1=110(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x), r6=98(y), r7=103(width), r8=55(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=473(x), r11=75(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 250
LDI r1, 110
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 98
LDI r7, 103
LDI r8, 55
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 473
LDI r11, 75
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
