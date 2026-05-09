; DESCRIPTION: Composite: Creates a black rectangular region at (164, 15) spanning 62 by 33 pixels then Draws a red line from (127, 113) to (276, 117) then Places a magenta dot at position (40, 227).
; PLAN: r0=164(x), r1=15(y), r2=62(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x1), r6=113(y1), r7=276(x2), r8=117(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=40(x), r11=227(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 15
LDI r2, 62
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 113
LDI r7, 276
LDI r8, 117
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 227
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
