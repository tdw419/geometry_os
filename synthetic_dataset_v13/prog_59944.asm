; DESCRIPTION: Composite: Creates a green rectangular region at (259, 80) spanning 109 by 38 pixels then Creates a red circular shape at (47, 104) with radius 19 then Places a green dot at position (92, 134).
; PLAN: r0=259(x), r1=80(y), r2=109(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=47(x), r6=104(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x), r11=134(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 259
LDI r1, 80
LDI r2, 109
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 104
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 134
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
