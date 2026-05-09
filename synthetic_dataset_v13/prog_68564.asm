; DESCRIPTION: Composite: Draws a green circle centered at (436, 11) with radius 11 then Sets a single green pixel at (354, 65) then Renders a black box of size 118x103 starting at (235, 8).
; PLAN: r0=436(x), r1=11(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x), r6=65(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=235(x), r11=8(y), r12=118(width), r13=103(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 11
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 65
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 235
LDI r11, 8
LDI r12, 118
LDI r13, 103
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
