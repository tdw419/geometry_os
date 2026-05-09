; DESCRIPTION: Composite: Renders a red line between points (161, 133) and (96, 91) then Places a white dot at position (229, 146) then Renders a orange box of size 70x89 starting at (174, 118).
; PLAN: r0=161(x1), r1=133(y1), r2=96(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=146(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=174(x), r11=118(y), r12=70(width), r13=89(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 133
LDI r2, 96
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 146
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 174
LDI r11, 118
LDI r12, 70
LDI r13, 89
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
