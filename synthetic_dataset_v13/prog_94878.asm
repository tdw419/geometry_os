; DESCRIPTION: Composite: Draws a cyan rectangle at (472, 146) with width 22 and height 10 then Sets a single orange pixel at (413, 7) then Creates a purple circular shape at (142, 153) with radius 18.
; PLAN: r0=472(x), r1=146(y), r2=22(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=7(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=142(x), r11=153(y), r12=18(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 472
LDI r1, 146
LDI r2, 22
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 7
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 142
LDI r11, 153
LDI r12, 18
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
