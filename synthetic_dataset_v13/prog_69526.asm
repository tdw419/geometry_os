; DESCRIPTION: Composite: Draws a orange line from (340, 157) to (159, 163) then Places a cyan dot at position (153, 81) then Creates a magenta rectangular region at (309, 114) spanning 73 by 60 pixels.
; PLAN: r0=340(x1), r1=157(y1), r2=159(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=81(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=309(x), r11=114(y), r12=73(width), r13=60(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 157
LDI r2, 159
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 81
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 309
LDI r11, 114
LDI r12, 73
LDI r13, 60
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
