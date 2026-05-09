; DESCRIPTION: Composite: Draws a black circle centered at (64, 204) with radius 33 then Sets a single cyan pixel at (364, 221) then Places a black line segment connecting (124, 73) to (497, 148).
; PLAN: r0=64(x), r1=204(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x), r6=221(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=124(x1), r11=73(y1), r12=497(x2), r13=148(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 204
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 221
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 124
LDI r11, 73
LDI r12, 497
LDI r13, 148
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
