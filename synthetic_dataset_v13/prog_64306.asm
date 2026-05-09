; DESCRIPTION: Composite: Renders a cyan box of size 44x18 starting at (353, 158) then Sets a single white pixel at (246, 254) then Renders a purple disk with center (92, 156) and radius 79.
; PLAN: r0=353(x), r1=158(y), r2=44(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=254(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=92(x), r11=156(y), r12=79(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 158
LDI r2, 44
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 254
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 92
LDI r11, 156
LDI r12, 79
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
