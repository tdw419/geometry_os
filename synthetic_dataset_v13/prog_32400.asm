; DESCRIPTION: Composite: Places a blue 35x11 rectangle at position (443, 183) then Sets a single red pixel at (348, 231) then Creates a green circular shape at (379, 96) with radius 65.
; PLAN: r0=443(x), r1=183(y), r2=35(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=231(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=379(x), r11=96(y), r12=65(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 443
LDI r1, 183
LDI r2, 35
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 231
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 379
LDI r11, 96
LDI r12, 65
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
