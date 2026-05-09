; DESCRIPTION: Composite: Places a black line segment connecting (333, 80) to (221, 98) then Places a black circle of radius 18 at center (224, 195) then Creates a white rectangular region at (71, 77) spanning 114 by 80 pixels.
; PLAN: r0=333(x1), r1=80(y1), r2=221(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=195(y), r7=18(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=71(x), r11=77(y), r12=114(width), r13=80(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 80
LDI r2, 221
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 195
LDI r7, 18
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 71
LDI r11, 77
LDI r12, 114
LDI r13, 80
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
