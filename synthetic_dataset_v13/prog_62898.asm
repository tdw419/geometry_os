; DESCRIPTION: Composite: Places a cyan dot at position (285, 110) then Creates a white rectangular region at (100, 103) spanning 49 by 12 pixels then Draws a orange line from (2, 54) to (102, 74).
; PLAN: r0=285(x), r1=110(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=103(y), r7=49(width), r8=12(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=2(x1), r11=54(y1), r12=102(x2), r13=74(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 110
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 103
LDI r7, 49
LDI r8, 12
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 54
LDI r12, 102
LDI r13, 74
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
