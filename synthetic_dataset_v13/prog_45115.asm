; DESCRIPTION: Composite: Sets a single green pixel at (267, 156) then Renders a white disk with center (377, 51) and radius 51 then Renders a orange box of size 77x65 starting at (185, 46).
; PLAN: r0=267(x), r1=156(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=377(x), r6=51(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=185(x), r11=46(y), r12=77(width), r13=65(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 156
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 377
LDI r6, 51
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 185
LDI r11, 46
LDI r12, 77
LDI r13, 65
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
