; DESCRIPTION: Composite: Places a orange 85x116 rectangle at position (350, 102) then Places a orange dot at position (156, 5) then Draws a yellow circle centered at (259, 162) with radius 75.
; PLAN: r0=350(x), r1=102(y), r2=85(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=5(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=259(x), r11=162(y), r12=75(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 350
LDI r1, 102
LDI r2, 85
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 5
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 259
LDI r11, 162
LDI r12, 75
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
