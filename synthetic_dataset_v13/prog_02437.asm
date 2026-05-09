; DESCRIPTION: Composite: Creates a yellow circular shape at (229, 110) with radius 44 then Sets a single cyan pixel at (263, 114) then Draws a purple rectangle at (100, 95) with width 51 and height 28.
; PLAN: r0=229(x), r1=110(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=114(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=100(x), r11=95(y), r12=51(width), r13=28(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 110
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 114
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 100
LDI r11, 95
LDI r12, 51
LDI r13, 28
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
