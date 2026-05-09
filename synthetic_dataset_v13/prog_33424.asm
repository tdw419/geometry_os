; DESCRIPTION: Composite: Creates a yellow circular shape at (176, 244) with radius 11 then Sets a single green pixel at (299, 31) then Places a green line segment connecting (79, 5) to (177, 250).
; PLAN: r0=176(x), r1=244(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x), r6=31(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=79(x1), r11=5(y1), r12=177(x2), r13=250(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 244
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 31
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 79
LDI r11, 5
LDI r12, 177
LDI r13, 250
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
