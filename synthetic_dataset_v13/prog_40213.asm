; DESCRIPTION: Composite: Sets a single white pixel at (282, 21) then Creates a green circular shape at (370, 96) with radius 60 then Places a blue line segment connecting (187, 150) to (318, 7).
; PLAN: r0=282(x), r1=21(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=96(y), r7=60(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x1), r11=150(y1), r12=318(x2), r13=7(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 21
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 96
LDI r7, 60
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 150
LDI r12, 318
LDI r13, 7
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
