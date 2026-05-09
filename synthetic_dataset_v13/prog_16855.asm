; DESCRIPTION: Composite: Creates a purple rectangular region at (183, 121) spanning 103 by 107 pixels then Places a blue line segment connecting (113, 141) to (251, 97) then Sets a single green pixel at (101, 168).
; PLAN: r0=183(x), r1=121(y), r2=103(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x1), r6=141(y1), r7=251(x2), r8=97(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=168(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 183
LDI r1, 121
LDI r2, 103
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 141
LDI r7, 251
LDI r8, 97
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 168
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
