; DESCRIPTION: Composite: Places a black 47x65 rectangle at position (421, 112) then Draws a orange line from (364, 228) to (415, 245) then Creates a magenta circular shape at (360, 45) with radius 13.
; PLAN: r0=421(x), r1=112(y), r2=47(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x1), r6=228(y1), r7=415(x2), r8=245(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=45(y), r12=13(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 421
LDI r1, 112
LDI r2, 47
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 228
LDI r7, 415
LDI r8, 245
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 45
LDI r12, 13
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
