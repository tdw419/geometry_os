; DESCRIPTION: Composite: Places a yellow circle of radius 11 at center (188, 60) then Sets a single green pixel at (365, 7) then Draws a blue rectangle at (198, 137) with width 83 and height 112.
; PLAN: r0=188(x), r1=60(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=365(x), r6=7(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=198(x), r11=137(y), r12=83(width), r13=112(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 60
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 365
LDI r6, 7
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 198
LDI r11, 137
LDI r12, 83
LDI r13, 112
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
