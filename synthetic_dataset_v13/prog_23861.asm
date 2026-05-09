; DESCRIPTION: Composite: Places a magenta line segment connecting (130, 181) to (383, 253) then Creates a black rectangular region at (444, 49) spanning 23 by 35 pixels.
; PLAN: r0=130(x1), r1=181(y1), r2=383(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=49(y), r7=23(width), r8=35(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 181
LDI r2, 383
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 49
LDI r7, 23
LDI r8, 35
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
