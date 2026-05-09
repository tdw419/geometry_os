; DESCRIPTION: Composite: Places a green dot at position (97, 95) then Creates a green circular shape at (193, 184) with radius 35 then Places a green line segment connecting (266, 242) to (310, 170).
; PLAN: r0=97(x), r1=95(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=193(x), r6=184(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=266(x1), r11=242(y1), r12=310(x2), r13=170(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 95
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 193
LDI r6, 184
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 266
LDI r11, 242
LDI r12, 310
LDI r13, 170
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
