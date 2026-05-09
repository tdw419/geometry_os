; DESCRIPTION: Composite: Creates a purple rectangular region at (190, 105) spanning 85 by 11 pixels then Places a blue dot at position (93, 209) then Creates a red circular shape at (229, 163) with radius 80.
; PLAN: r0=190(x), r1=105(y), r2=85(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=209(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=229(x), r11=163(y), r12=80(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 190
LDI r1, 105
LDI r2, 85
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 209
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 229
LDI r11, 163
LDI r12, 80
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
