; DESCRIPTION: Composite: Sets a single cyan pixel at (415, 189) then Renders a blue disk with center (186, 135) and radius 41 then Creates a yellow rectangular region at (263, 183) spanning 54 by 61 pixels.
; PLAN: r0=415(x), r1=189(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=135(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=263(x), r11=183(y), r12=54(width), r13=61(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 189
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 135
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 263
LDI r11, 183
LDI r12, 54
LDI r13, 61
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
