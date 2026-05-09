; DESCRIPTION: Composite: Places a purple line segment connecting (240, 63) to (457, 151) then Creates a red rectangular region at (445, 55) spanning 14 by 79 pixels then Places a black dot at position (307, 251).
; PLAN: r0=240(x1), r1=63(y1), r2=457(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=445(x), r6=55(y), r7=14(width), r8=79(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=307(x), r11=251(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 63
LDI r2, 457
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 55
LDI r7, 14
LDI r8, 79
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 251
LDI r12, 0x000000
PSET r10, r11, r12
HALT
