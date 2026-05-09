; DESCRIPTION: Composite: Places a magenta 50x11 rectangle at position (342, 241) then Sets a single orange pixel at (469, 150) then Places a yellow circle of radius 64 at center (78, 119).
; PLAN: r0=342(x), r1=241(y), r2=50(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x), r6=150(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=78(x), r11=119(y), r12=64(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 342
LDI r1, 241
LDI r2, 50
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 150
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 78
LDI r11, 119
LDI r12, 64
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
