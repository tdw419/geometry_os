; DESCRIPTION: Composite: Places a yellow 83x34 rectangle at position (422, 24) then Places a black circle of radius 30 at center (183, 200) then Sets a single yellow pixel at (61, 169).
; PLAN: r0=422(x), r1=24(y), r2=83(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=200(y), r7=30(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=61(x), r11=169(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 422
LDI r1, 24
LDI r2, 83
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 200
LDI r7, 30
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 61
LDI r11, 169
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
