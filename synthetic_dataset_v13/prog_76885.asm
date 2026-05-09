; DESCRIPTION: Composite: Places a green line segment connecting (153, 144) to (196, 86) then Creates a purple rectangular region at (67, 118) spanning 97 by 75 pixels then Places a red dot at position (159, 156).
; PLAN: r0=153(x1), r1=144(y1), r2=196(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=118(y), r7=97(width), r8=75(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=159(x), r11=156(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 153
LDI r1, 144
LDI r2, 196
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 118
LDI r7, 97
LDI r8, 75
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 156
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
