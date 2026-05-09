; DESCRIPTION: Composite: Places a cyan 30x70 rectangle at position (124, 78) then Creates a yellow circular shape at (156, 108) with radius 64 then Draws a magenta line from (181, 31) to (334, 41).
; PLAN: r0=124(x), r1=78(y), r2=30(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=108(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=181(x1), r11=31(y1), r12=334(x2), r13=41(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 78
LDI r2, 30
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 108
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 181
LDI r11, 31
LDI r12, 334
LDI r13, 41
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
