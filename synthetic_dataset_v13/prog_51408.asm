; DESCRIPTION: Composite: Draws a green circle centered at (65, 40) with radius 37 then Renders a white box of size 100x111 starting at (77, 70) then Sets a single black pixel at (11, 39).
; PLAN: r0=65(x), r1=40(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=70(y), r7=100(width), r8=111(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=11(x), r11=39(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 65
LDI r1, 40
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 70
LDI r7, 100
LDI r8, 111
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 39
LDI r12, 0x000000
PSET r10, r11, r12
HALT
