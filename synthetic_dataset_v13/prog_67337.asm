; DESCRIPTION: Composite: Draws a red line from (29, 182) to (240, 11) then Creates a white rectangular region at (242, 112) spanning 33 by 95 pixels then Places a blue circle of radius 74 at center (268, 77).
; PLAN: r0=29(x1), r1=182(y1), r2=240(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=112(y), r7=33(width), r8=95(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=268(x), r11=77(y), r12=74(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 29
LDI r1, 182
LDI r2, 240
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 112
LDI r7, 33
LDI r8, 95
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 77
LDI r12, 74
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
