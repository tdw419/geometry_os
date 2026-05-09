; DESCRIPTION: Composite: Places a purple circle of radius 57 at center (70, 189) then Sets a single cyan pixel at (179, 79) then Creates a cyan rectangular region at (16, 158) spanning 117 by 37 pixels.
; PLAN: r0=70(x), r1=189(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=79(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=16(x), r11=158(y), r12=117(width), r13=37(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 189
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 79
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 16
LDI r11, 158
LDI r12, 117
LDI r13, 37
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
