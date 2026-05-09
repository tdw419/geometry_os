; DESCRIPTION: Composite: Places a blue circle of radius 50 at center (361, 117) then Sets a single blue pixel at (88, 190) then Renders a white box of size 10x105 starting at (165, 136).
; PLAN: r0=361(x), r1=117(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x), r6=190(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=165(x), r11=136(y), r12=10(width), r13=105(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 117
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 190
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 165
LDI r11, 136
LDI r12, 10
LDI r13, 105
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
