; DESCRIPTION: Composite: Creates a white circular shape at (220, 88) with radius 64 then Sets a single red pixel at (400, 1) then Creates a yellow rectangular region at (256, 110) spanning 91 by 24 pixels.
; PLAN: r0=220(x), r1=88(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=1(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=256(x), r11=110(y), r12=91(width), r13=24(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 88
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 1
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 256
LDI r11, 110
LDI r12, 91
LDI r13, 24
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
