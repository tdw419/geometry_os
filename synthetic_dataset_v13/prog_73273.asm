; DESCRIPTION: Composite: Places a cyan dot at position (15, 148) then Creates a cyan circular shape at (219, 128) with radius 30 then Renders a white line between points (316, 108) and (293, 43).
; PLAN: r0=15(x), r1=148(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=128(y), r7=30(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=316(x1), r11=108(y1), r12=293(x2), r13=43(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 148
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 219
LDI r6, 128
LDI r7, 30
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 316
LDI r11, 108
LDI r12, 293
LDI r13, 43
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
