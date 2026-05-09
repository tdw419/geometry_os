; DESCRIPTION: Composite: Sets a single cyan pixel at (499, 155) then Creates a black circular shape at (176, 171) with radius 34 then Creates a purple rectangular region at (415, 66) spanning 24 by 103 pixels.
; PLAN: r0=499(x), r1=155(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=171(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=415(x), r11=66(y), r12=24(width), r13=103(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 499
LDI r1, 155
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 176
LDI r6, 171
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 415
LDI r11, 66
LDI r12, 24
LDI r13, 103
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
