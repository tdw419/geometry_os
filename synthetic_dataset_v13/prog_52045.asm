; DESCRIPTION: Composite: Places a purple dot at position (321, 87) then Places a purple 25x16 rectangle at position (44, 9) then Creates a red circular shape at (134, 100) with radius 61.
; PLAN: r0=321(x), r1=87(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=44(x), r6=9(y), r7=25(width), r8=16(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x), r11=100(y), r12=61(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 87
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 44
LDI r6, 9
LDI r7, 25
LDI r8, 16
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 100
LDI r12, 61
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
