; DESCRIPTION: Composite: Creates a red rectangular region at (96, 114) spanning 61 by 106 pixels then Draws a white line from (109, 244) to (270, 163) then Places a white dot at position (46, 172).
; PLAN: r0=96(x), r1=114(y), r2=61(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x1), r6=244(y1), r7=270(x2), r8=163(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=46(x), r11=172(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 114
LDI r2, 61
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 244
LDI r7, 270
LDI r8, 163
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 172
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
