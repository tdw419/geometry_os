; DESCRIPTION: Composite: Places a yellow circle of radius 59 at center (394, 79) then Places a black dot at position (235, 7) then Draws a orange rectangle at (45, 64) with width 21 and height 18.
; PLAN: r0=394(x), r1=79(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=7(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=45(x), r11=64(y), r12=21(width), r13=18(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 79
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 7
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 45
LDI r11, 64
LDI r12, 21
LDI r13, 18
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
