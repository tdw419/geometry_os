; DESCRIPTION: Composite: Draws a blue rectangle at (157, 190) with width 89 and height 35 then Sets a single white pixel at (98, 161) then Renders a orange line between points (344, 128) and (411, 171).
; PLAN: r0=157(x), r1=190(y), r2=89(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=161(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=344(x1), r11=128(y1), r12=411(x2), r13=171(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 190
LDI r2, 89
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 161
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 344
LDI r11, 128
LDI r12, 411
LDI r13, 171
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
