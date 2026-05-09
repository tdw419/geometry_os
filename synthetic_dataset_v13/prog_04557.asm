; DESCRIPTION: Composite: Places a blue 16x102 rectangle at position (438, 109) then Sets a single cyan pixel at (30, 190) then Creates a orange circular shape at (132, 165) with radius 72.
; PLAN: r0=438(x), r1=109(y), r2=16(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=30(x), r6=190(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=132(x), r11=165(y), r12=72(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 438
LDI r1, 109
LDI r2, 16
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 190
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 132
LDI r11, 165
LDI r12, 72
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
