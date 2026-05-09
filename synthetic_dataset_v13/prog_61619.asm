; DESCRIPTION: Composite: Creates a yellow circular shape at (300, 116) with radius 49 then Sets a single orange pixel at (153, 151) then Places a black line segment connecting (297, 223) to (289, 95).
; PLAN: r0=300(x), r1=116(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=151(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=297(x1), r11=223(y1), r12=289(x2), r13=95(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 116
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 151
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 297
LDI r11, 223
LDI r12, 289
LDI r13, 95
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
