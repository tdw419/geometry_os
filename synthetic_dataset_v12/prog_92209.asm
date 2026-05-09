; DESCRIPTION: Composite: Sets a single magenta pixel at (189, 254) then Renders a yellow box of size 98x35 starting at (381, 90) then Draws a green circle centered at (340, 72) with radius 69.
; PLAN: r0=189(x), r1=254(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=90(y), r7=98(width), r8=35(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=340(x), r11=72(y), r12=69(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 189
LDI r1, 254
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 381
LDI r6, 90
LDI r7, 98
LDI r8, 35
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 72
LDI r12, 69
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
