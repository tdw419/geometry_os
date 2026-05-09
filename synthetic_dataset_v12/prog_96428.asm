; DESCRIPTION: Composite: Places a red line segment connecting (480, 178) to (312, 180) then Creates a white rectangular region at (66, 26) spanning 57 by 15 pixels then Sets a single white pixel at (324, 53).
; PLAN: r0=480(x1), r1=178(y1), r2=312(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=26(y), r7=57(width), r8=15(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=324(x), r11=53(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 480
LDI r1, 178
LDI r2, 312
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 26
LDI r7, 57
LDI r8, 15
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 53
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
