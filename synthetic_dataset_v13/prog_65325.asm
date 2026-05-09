; DESCRIPTION: Composite: Sets a single green pixel at (383, 103) then Creates a purple circular shape at (177, 161) with radius 26 then Creates a green rectangular region at (39, 130) spanning 92 by 94 pixels.
; PLAN: r0=383(x), r1=103(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=161(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=39(x), r11=130(y), r12=92(width), r13=94(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 103
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 177
LDI r6, 161
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 39
LDI r11, 130
LDI r12, 92
LDI r13, 94
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
