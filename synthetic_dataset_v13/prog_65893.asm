; DESCRIPTION: Composite: Draws a white circle centered at (256, 120) with radius 43 then Sets a single yellow pixel at (430, 13) then Places a green line segment connecting (243, 191) to (310, 93).
; PLAN: r0=256(x), r1=120(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=13(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=243(x1), r11=191(y1), r12=310(x2), r13=93(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 120
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 13
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 243
LDI r11, 191
LDI r12, 310
LDI r13, 93
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
