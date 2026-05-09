; DESCRIPTION: Composite: Draws a yellow circle centered at (328, 152) with radius 72 then Sets a single green pixel at (34, 85).
; PLAN: r0=328(x), r1=152(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x), r6=85(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 328
LDI r1, 152
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 85
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
