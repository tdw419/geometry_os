; DESCRIPTION: Composite: Sets a single magenta pixel at (145, 221) then Draws a blue line from (272, 68) to (232, 146) then Renders a purple box of size 115x34 starting at (162, 194).
; PLAN: r0=145(x), r1=221(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=272(x1), r6=68(y1), r7=232(x2), r8=146(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=162(x), r11=194(y), r12=115(width), r13=34(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 221
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 68
LDI r7, 232
LDI r8, 146
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 194
LDI r12, 115
LDI r13, 34
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
