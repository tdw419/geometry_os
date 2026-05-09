; DESCRIPTION: Composite: Places a black circle of radius 34 at center (410, 78) then Sets a single green pixel at (246, 239) then Renders a green box of size 112x76 starting at (37, 48).
; PLAN: r0=410(x), r1=78(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=239(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=37(x), r11=48(y), r12=112(width), r13=76(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 78
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 239
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 37
LDI r11, 48
LDI r12, 112
LDI r13, 76
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
