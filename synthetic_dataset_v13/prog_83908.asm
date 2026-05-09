; DESCRIPTION: Composite: Places a purple dot at position (479, 15) then Places a magenta line segment connecting (99, 43) to (241, 96) then Creates a black rectangular region at (146, 158) spanning 22 by 61 pixels.
; PLAN: r0=479(x), r1=15(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=99(x1), r6=43(y1), r7=241(x2), r8=96(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=158(y), r12=22(width), r13=61(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 15
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 99
LDI r6, 43
LDI r7, 241
LDI r8, 96
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 158
LDI r12, 22
LDI r13, 61
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
