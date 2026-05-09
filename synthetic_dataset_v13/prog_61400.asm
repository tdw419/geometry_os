; DESCRIPTION: Composite: Places a green 15x73 rectangle at position (226, 173) then Sets a single purple pixel at (465, 40) then Creates a purple circular shape at (444, 98) with radius 16.
; PLAN: r0=226(x), r1=173(y), r2=15(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=40(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=444(x), r11=98(y), r12=16(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 226
LDI r1, 173
LDI r2, 15
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 40
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 444
LDI r11, 98
LDI r12, 16
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
