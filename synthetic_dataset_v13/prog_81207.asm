; DESCRIPTION: Composite: Creates a cyan rectangular region at (218, 189) spanning 43 by 13 pixels then Sets a single blue pixel at (187, 119) then Renders a cyan disk with center (90, 109) and radius 34.
; PLAN: r0=218(x), r1=189(y), r2=43(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=119(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=90(x), r11=109(y), r12=34(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 218
LDI r1, 189
LDI r2, 43
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 119
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 90
LDI r11, 109
LDI r12, 34
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
