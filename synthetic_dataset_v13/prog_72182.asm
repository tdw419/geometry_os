; DESCRIPTION: Composite: Creates a magenta rectangular region at (219, 154) spanning 34 by 77 pixels then Places a white dot at position (24, 5) then Places a red line segment connecting (222, 245) to (246, 245).
; PLAN: r0=219(x), r1=154(y), r2=34(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=24(x), r6=5(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=222(x1), r11=245(y1), r12=246(x2), r13=245(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 219
LDI r1, 154
LDI r2, 34
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 5
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 222
LDI r11, 245
LDI r12, 246
LDI r13, 245
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
