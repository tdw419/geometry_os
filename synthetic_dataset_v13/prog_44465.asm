; DESCRIPTION: Composite: Sets a single white pixel at (23, 137) then Places a magenta 58x19 rectangle at position (81, 83) then Renders a orange line between points (174, 102) and (1, 77).
; PLAN: r0=23(x), r1=137(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=83(y), r7=58(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=174(x1), r11=102(y1), r12=1(x2), r13=77(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 137
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 83
LDI r7, 58
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 102
LDI r12, 1
LDI r13, 77
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
