; DESCRIPTION: Composite: Renders a red disk with center (247, 151) and radius 15 then Creates a yellow rectangular region at (306, 62) spanning 92 by 51 pixels then Draws a cyan line from (347, 53) to (18, 206).
; PLAN: r0=247(x), r1=151(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x), r6=62(y), r7=92(width), r8=51(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=347(x1), r11=53(y1), r12=18(x2), r13=206(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 151
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 62
LDI r7, 92
LDI r8, 51
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 53
LDI r12, 18
LDI r13, 206
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
