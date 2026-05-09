; DESCRIPTION: Composite: Creates a green rectangular region at (47, 123) spanning 104 by 32 pixels then Renders a cyan line between points (136, 84) and (163, 28).
; PLAN: r0=47(x), r1=123(y), r2=104(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x1), r6=84(y1), r7=163(x2), r8=28(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 123
LDI r2, 104
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 84
LDI r7, 163
LDI r8, 28
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
