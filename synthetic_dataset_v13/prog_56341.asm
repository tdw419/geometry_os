; DESCRIPTION: Composite: Sets a single white pixel at (35, 114) then Creates a orange circular shape at (90, 96) with radius 43 then Draws a red line from (10, 70) to (322, 174).
; PLAN: r0=35(x), r1=114(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=96(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=10(x1), r11=70(y1), r12=322(x2), r13=174(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 114
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 96
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 10
LDI r11, 70
LDI r12, 322
LDI r13, 174
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
