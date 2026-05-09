; DESCRIPTION: Composite: Draws a black line from (73, 215) to (432, 238) then Creates a red rectangular region at (391, 47) spanning 115 by 91 pixels then Places a purple circle of radius 13 at center (205, 143).
; PLAN: r0=73(x1), r1=215(y1), r2=432(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=47(y), r7=115(width), r8=91(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x), r11=143(y), r12=13(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 73
LDI r1, 215
LDI r2, 432
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 47
LDI r7, 115
LDI r8, 91
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 143
LDI r12, 13
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
