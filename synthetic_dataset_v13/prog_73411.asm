; DESCRIPTION: Composite: Renders a green box of size 67x77 starting at (334, 150) then Renders a red line between points (335, 104) and (399, 189) then Places a red circle of radius 77 at center (297, 92).
; PLAN: r0=334(x), r1=150(y), r2=67(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x1), r6=104(y1), r7=399(x2), r8=189(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=297(x), r11=92(y), r12=77(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 150
LDI r2, 67
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 104
LDI r7, 399
LDI r8, 189
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 92
LDI r12, 77
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
