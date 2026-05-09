; DESCRIPTION: Composite: Creates a orange rectangular region at (177, 65) spanning 96 by 22 pixels then Draws a blue line from (496, 231) to (337, 116) then Places a purple dot at position (426, 175).
; PLAN: r0=177(x), r1=65(y), r2=96(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=496(x1), r6=231(y1), r7=337(x2), r8=116(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=426(x), r11=175(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 177
LDI r1, 65
LDI r2, 96
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 231
LDI r7, 337
LDI r8, 116
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 175
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
