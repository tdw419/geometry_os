; DESCRIPTION: Composite: Places a red dot at position (249, 184) then Creates a red rectangular region at (121, 0) spanning 39 by 70 pixels then Draws a yellow line from (225, 190) to (447, 5).
; PLAN: r0=249(x), r1=184(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=0(y), r7=39(width), r8=70(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=225(x1), r11=190(y1), r12=447(x2), r13=5(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 184
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 121
LDI r6, 0
LDI r7, 39
LDI r8, 70
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 190
LDI r12, 447
LDI r13, 5
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
