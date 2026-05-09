; DESCRIPTION: Composite: Places a magenta 54x21 rectangle at position (139, 25) then Places a orange line segment connecting (10, 165) to (415, 56) then Sets a single white pixel at (406, 156).
; PLAN: r0=139(x), r1=25(y), r2=54(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x1), r6=165(y1), r7=415(x2), r8=56(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=156(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 25
LDI r2, 54
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 165
LDI r7, 415
LDI r8, 56
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 156
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
