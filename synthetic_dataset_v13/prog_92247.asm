; DESCRIPTION: Composite: Renders a yellow line between points (366, 68) and (247, 123) then Creates a black rectangular region at (266, 86) spanning 20 by 64 pixels.
; PLAN: r0=366(x1), r1=68(y1), r2=247(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=86(y), r7=20(width), r8=64(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 68
LDI r2, 247
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 86
LDI r7, 20
LDI r8, 64
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
