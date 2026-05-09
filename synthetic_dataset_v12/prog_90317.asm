; DESCRIPTION: Composite: Places a green circle of radius 36 at center (45, 181) then Sets a single blue pixel at (488, 125) then Places a magenta 75x66 rectangle at position (7, 78).
; PLAN: r0=45(x), r1=181(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x), r6=125(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=7(x), r11=78(y), r12=75(width), r13=66(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 181
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 125
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 7
LDI r11, 78
LDI r12, 75
LDI r13, 66
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
