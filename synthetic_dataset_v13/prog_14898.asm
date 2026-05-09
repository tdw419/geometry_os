; DESCRIPTION: Composite: Sets a single magenta pixel at (309, 151) then Places a purple line segment connecting (437, 73) to (193, 188) then Draws a yellow rectangle at (91, 133) with width 92 and height 85.
; PLAN: r0=309(x), r1=151(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=437(x1), r6=73(y1), r7=193(x2), r8=188(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=91(x), r11=133(y), r12=92(width), r13=85(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 151
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 437
LDI r6, 73
LDI r7, 193
LDI r8, 188
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 133
LDI r12, 92
LDI r13, 85
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
