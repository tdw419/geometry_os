; DESCRIPTION: Composite: Renders a white box of size 103x82 starting at (301, 159) then Sets a single green pixel at (92, 96) then Renders a black disk with center (357, 218) and radius 34.
; PLAN: r0=301(x), r1=159(y), r2=103(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=96(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=357(x), r11=218(y), r12=34(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 159
LDI r2, 103
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 96
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 357
LDI r11, 218
LDI r12, 34
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
