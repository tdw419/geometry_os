; DESCRIPTION: Composite: Renders a yellow line between points (364, 4) and (39, 172) then Creates a green rectangular region at (116, 112) spanning 28 by 80 pixels.
; PLAN: r0=364(x1), r1=4(y1), r2=39(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=112(y), r7=28(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 4
LDI r2, 39
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 112
LDI r7, 28
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
