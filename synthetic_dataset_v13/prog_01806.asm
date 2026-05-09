; DESCRIPTION: Composite: Renders a red box of size 37x118 starting at (92, 90) then Creates a white circular shape at (48, 194) with radius 38 then Sets a single white pixel at (314, 63).
; PLAN: r0=92(x), r1=90(y), r2=37(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=48(x), r6=194(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x), r11=63(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 92
LDI r1, 90
LDI r2, 37
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 194
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 63
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
