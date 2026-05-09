; DESCRIPTION: Composite: Draws a purple line from (65, 80) to (464, 49) then Creates a white rectangular region at (183, 124) spanning 73 by 86 pixels then Places a red dot at position (121, 85).
; PLAN: r0=65(x1), r1=80(y1), r2=464(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=124(y), r7=73(width), r8=86(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=121(x), r11=85(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 65
LDI r1, 80
LDI r2, 464
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 124
LDI r7, 73
LDI r8, 86
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 121
LDI r11, 85
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
