; DESCRIPTION: Composite: Sets a single yellow pixel at (366, 140) then Renders a orange line between points (397, 206) and (344, 234) then Places a red circle of radius 75 at center (152, 101).
; PLAN: r0=366(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=397(x1), r6=206(y1), r7=344(x2), r8=234(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=152(x), r11=101(y), r12=75(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 366
LDI r1, 140
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 397
LDI r6, 206
LDI r7, 344
LDI r8, 234
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 101
LDI r12, 75
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
