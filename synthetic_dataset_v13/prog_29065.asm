; DESCRIPTION: Composite: Renders a green disk with center (359, 164) and radius 55 then Creates a green rectangular region at (62, 6) spanning 74 by 40 pixels then Sets a single magenta pixel at (153, 235).
; PLAN: r0=359(x), r1=164(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x), r6=6(y), r7=74(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=153(x), r11=235(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 359
LDI r1, 164
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 6
LDI r7, 74
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 235
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
