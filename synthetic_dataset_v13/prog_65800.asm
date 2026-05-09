; DESCRIPTION: Composite: Places a black dot at position (468, 173) then Places a red line segment connecting (7, 182) to (246, 149) then Creates a green rectangular region at (292, 113) spanning 39 by 101 pixels.
; PLAN: r0=468(x), r1=173(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=7(x1), r6=182(y1), r7=246(x2), r8=149(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=292(x), r11=113(y), r12=39(width), r13=101(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 468
LDI r1, 173
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 7
LDI r6, 182
LDI r7, 246
LDI r8, 149
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 113
LDI r12, 39
LDI r13, 101
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
