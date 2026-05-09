; DESCRIPTION: Composite: Sets a single magenta pixel at (4, 71) then Creates a black rectangular region at (315, 146) spanning 34 by 39 pixels then Places a blue line segment connecting (408, 221) to (407, 144).
; PLAN: r0=4(x), r1=71(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=315(x), r6=146(y), r7=34(width), r8=39(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x1), r11=221(y1), r12=407(x2), r13=144(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 4
LDI r1, 71
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 315
LDI r6, 146
LDI r7, 34
LDI r8, 39
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 221
LDI r12, 407
LDI r13, 144
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
