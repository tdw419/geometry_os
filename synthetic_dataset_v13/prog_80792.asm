; DESCRIPTION: Composite: Places a yellow 53x79 rectangle at position (417, 99) then Draws a orange circle centered at (365, 190) with radius 40 then Places a orange line segment connecting (177, 168) to (134, 138).
; PLAN: r0=417(x), r1=99(y), r2=53(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=190(y), r7=40(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=177(x1), r11=168(y1), r12=134(x2), r13=138(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 99
LDI r2, 53
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 190
LDI r7, 40
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 177
LDI r11, 168
LDI r12, 134
LDI r13, 138
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
