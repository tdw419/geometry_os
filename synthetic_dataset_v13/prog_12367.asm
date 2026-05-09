; DESCRIPTION: Composite: Renders a orange line between points (240, 23) and (364, 200) then Creates a red rectangular region at (324, 38) spanning 34 by 18 pixels.
; PLAN: r0=240(x1), r1=23(y1), r2=364(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=38(y), r7=34(width), r8=18(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 23
LDI r2, 364
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 38
LDI r7, 34
LDI r8, 18
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
