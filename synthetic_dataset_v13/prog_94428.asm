; DESCRIPTION: Composite: Sets a single cyan pixel at (140, 170) then Creates a green circular shape at (129, 57) with radius 18 then Creates a blue rectangular region at (251, 53) spanning 47 by 64 pixels.
; PLAN: r0=140(x), r1=170(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=129(x), r6=57(y), r7=18(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=251(x), r11=53(y), r12=47(width), r13=64(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 170
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 129
LDI r6, 57
LDI r7, 18
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 251
LDI r11, 53
LDI r12, 47
LDI r13, 64
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
