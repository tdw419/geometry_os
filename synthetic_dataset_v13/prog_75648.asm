; DESCRIPTION: Composite: Renders a yellow box of size 17x113 starting at (333, 89) then Sets a single green pixel at (136, 235) then Draws a red circle centered at (60, 189) with radius 46.
; PLAN: r0=333(x), r1=89(y), r2=17(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=235(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=60(x), r11=189(y), r12=46(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 333
LDI r1, 89
LDI r2, 17
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 235
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 60
LDI r11, 189
LDI r12, 46
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
