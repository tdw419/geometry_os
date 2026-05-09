; DESCRIPTION: Composite: Sets a single yellow pixel at (174, 189) then Draws a blue rectangle at (129, 71) with width 76 and height 71 then Creates a magenta circular shape at (162, 112) with radius 76.
; PLAN: r0=174(x), r1=189(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=129(x), r6=71(y), r7=76(width), r8=71(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x), r11=112(y), r12=76(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 189
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 129
LDI r6, 71
LDI r7, 76
LDI r8, 71
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 112
LDI r12, 76
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
