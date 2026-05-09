; DESCRIPTION: Composite: Renders a cyan disk with center (290, 171) and radius 51 then Creates a black rectangular region at (225, 218) spanning 21 by 10 pixels then Sets a single blue pixel at (234, 142).
; PLAN: r0=290(x), r1=171(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=218(y), r7=21(width), r8=10(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=142(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 290
LDI r1, 171
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 218
LDI r7, 21
LDI r8, 10
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 142
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
