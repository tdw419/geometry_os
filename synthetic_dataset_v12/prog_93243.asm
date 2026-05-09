; DESCRIPTION: Composite: Places a cyan 86x66 rectangle at position (406, 83) then Sets a single yellow pixel at (23, 192) then Creates a cyan circular shape at (379, 176) with radius 29.
; PLAN: r0=406(x), r1=83(y), r2=86(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x), r6=192(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=379(x), r11=176(y), r12=29(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 406
LDI r1, 83
LDI r2, 86
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 192
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 379
LDI r11, 176
LDI r12, 29
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
