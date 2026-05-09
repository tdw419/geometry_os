; DESCRIPTION: Composite: Draws a cyan line from (339, 170) to (302, 100) then Draws a red circle centered at (433, 143) with radius 22 then Creates a purple rectangular region at (107, 25) spanning 113 by 56 pixels.
; PLAN: r0=339(x1), r1=170(y1), r2=302(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=143(y), r7=22(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=107(x), r11=25(y), r12=113(width), r13=56(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 170
LDI r2, 302
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 143
LDI r7, 22
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 107
LDI r11, 25
LDI r12, 113
LDI r13, 56
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
