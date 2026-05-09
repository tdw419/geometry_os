; DESCRIPTION: Composite: Sets a single red pixel at (124, 192) then Creates a purple circular shape at (153, 177) with radius 15 then Creates a blue rectangular region at (120, 159) spanning 39 by 17 pixels.
; PLAN: r0=124(x), r1=192(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=177(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x), r11=159(y), r12=39(width), r13=17(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 192
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 153
LDI r6, 177
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 159
LDI r12, 39
LDI r13, 17
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
