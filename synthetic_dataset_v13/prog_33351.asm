; DESCRIPTION: Composite: Sets a single yellow pixel at (59, 72) then Creates a black rectangular region at (7, 34) spanning 113 by 103 pixels then Renders a red line between points (238, 125) and (263, 193).
; PLAN: r0=59(x), r1=72(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=7(x), r6=34(y), r7=113(width), r8=103(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=238(x1), r11=125(y1), r12=263(x2), r13=193(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 72
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 7
LDI r6, 34
LDI r7, 113
LDI r8, 103
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 125
LDI r12, 263
LDI r13, 193
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
