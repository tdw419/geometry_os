; DESCRIPTION: Composite: Places a red 31x100 rectangle at position (318, 18) then Places a red circle of radius 52 at center (60, 199) then Places a black dot at position (326, 181).
; PLAN: r0=318(x), r1=18(y), r2=31(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=199(y), r7=52(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=326(x), r11=181(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 318
LDI r1, 18
LDI r2, 31
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 199
LDI r7, 52
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 326
LDI r11, 181
LDI r12, 0x000000
PSET r10, r11, r12
HALT
