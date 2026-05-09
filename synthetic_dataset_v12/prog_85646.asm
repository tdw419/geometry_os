; DESCRIPTION: Composite: Draws a white rectangle at (106, 46) with width 119 and height 103 then Renders a magenta disk with center (303, 163) and radius 73 then Sets a single red pixel at (50, 140).
; PLAN: r0=106(x), r1=46(y), r2=119(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=163(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=50(x), r11=140(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 106
LDI r1, 46
LDI r2, 119
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 163
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 50
LDI r11, 140
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
