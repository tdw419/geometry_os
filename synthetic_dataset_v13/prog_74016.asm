; DESCRIPTION: Composite: Creates a black rectangular region at (383, 19) spanning 25 by 32 pixels then Renders a orange line between points (144, 44) and (318, 88).
; PLAN: r0=383(x), r1=19(y), r2=25(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x1), r6=44(y1), r7=318(x2), r8=88(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 19
LDI r2, 25
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 44
LDI r7, 318
LDI r8, 88
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
