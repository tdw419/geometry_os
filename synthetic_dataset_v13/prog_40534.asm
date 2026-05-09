; DESCRIPTION: Composite: Creates a white rectangular region at (85, 104) spanning 91 by 92 pixels then Renders a red line between points (95, 145) and (255, 182).
; PLAN: r0=85(x), r1=104(y), r2=91(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x1), r6=145(y1), r7=255(x2), r8=182(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 104
LDI r2, 91
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 145
LDI r7, 255
LDI r8, 182
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
