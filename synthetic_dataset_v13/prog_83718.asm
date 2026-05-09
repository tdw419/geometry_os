; DESCRIPTION: Composite: Sets a single blue pixel at (295, 46) then Creates a green circular shape at (154, 83) with radius 34 then Creates a yellow rectangular region at (415, 112) spanning 72 by 20 pixels.
; PLAN: r0=295(x), r1=46(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=154(x), r6=83(y), r7=34(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=415(x), r11=112(y), r12=72(width), r13=20(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 295
LDI r1, 46
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 154
LDI r6, 83
LDI r7, 34
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 415
LDI r11, 112
LDI r12, 72
LDI r13, 20
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
