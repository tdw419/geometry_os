; DESCRIPTION: Composite: Creates a orange circular shape at (364, 53) with radius 37 then Places a orange dot at position (93, 134) then Draws a yellow line from (406, 22) to (464, 97).
; PLAN: r0=364(x), r1=53(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=134(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=406(x1), r11=22(y1), r12=464(x2), r13=97(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 53
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 134
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 406
LDI r11, 22
LDI r12, 464
LDI r13, 97
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
