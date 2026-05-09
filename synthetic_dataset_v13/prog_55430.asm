; DESCRIPTION: Composite: Renders a orange line between points (133, 111) and (178, 34) then Creates a yellow rectangular region at (415, 15) spanning 86 by 81 pixels.
; PLAN: r0=133(x1), r1=111(y1), r2=178(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=15(y), r7=86(width), r8=81(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 111
LDI r2, 178
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 15
LDI r7, 86
LDI r8, 81
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
