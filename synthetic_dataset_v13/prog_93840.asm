; DESCRIPTION: Composite: Sets a single green pixel at (301, 170) then Renders a white box of size 107x21 starting at (322, 126) then Renders a white disk with center (289, 189) and radius 35.
; PLAN: r0=301(x), r1=170(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=126(y), r7=107(width), r8=21(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=289(x), r11=189(y), r12=35(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 170
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 322
LDI r6, 126
LDI r7, 107
LDI r8, 21
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 189
LDI r12, 35
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
