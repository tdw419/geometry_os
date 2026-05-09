; DESCRIPTION: Composite: Renders a magenta box of size 102x72 starting at (239, 21) then Renders a purple disk with center (391, 185) and radius 66 then Sets a single green pixel at (252, 248).
; PLAN: r0=239(x), r1=21(y), r2=102(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=185(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=252(x), r11=248(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 239
LDI r1, 21
LDI r2, 102
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 185
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 252
LDI r11, 248
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
