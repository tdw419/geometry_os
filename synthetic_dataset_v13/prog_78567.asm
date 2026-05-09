; DESCRIPTION: Composite: Creates a cyan rectangular region at (131, 128) spanning 68 by 115 pixels then Sets a single orange pixel at (276, 59) then Draws a blue circle centered at (128, 90) with radius 80.
; PLAN: r0=131(x), r1=128(y), r2=68(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=59(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=128(x), r11=90(y), r12=80(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 128
LDI r2, 68
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 59
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 128
LDI r11, 90
LDI r12, 80
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
