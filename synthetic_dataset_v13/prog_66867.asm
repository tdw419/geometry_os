; DESCRIPTION: Composite: Draws a cyan circle centered at (78, 177) with radius 49 then Places a purple dot at position (31, 17) then Creates a blue rectangular region at (453, 50) spanning 20 by 65 pixels.
; PLAN: r0=78(x), r1=177(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=17(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=453(x), r11=50(y), r12=20(width), r13=65(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 177
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 17
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 453
LDI r11, 50
LDI r12, 20
LDI r13, 65
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
