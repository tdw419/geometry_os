; DESCRIPTION: Composite: Places a green 38x72 rectangle at position (347, 142) then Places a red dot at position (199, 61) then Creates a orange circular shape at (47, 162) with radius 32.
; PLAN: r0=347(x), r1=142(y), r2=38(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=61(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=47(x), r11=162(y), r12=32(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 142
LDI r2, 38
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 61
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 47
LDI r11, 162
LDI r12, 32
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
