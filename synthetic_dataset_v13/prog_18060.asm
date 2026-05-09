; DESCRIPTION: Composite: Draws a orange rectangle at (438, 23) with width 73 and height 36 then Sets a single black pixel at (244, 117) then Draws a red line from (394, 112) to (170, 163).
; PLAN: r0=438(x), r1=23(y), r2=73(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=117(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=394(x1), r11=112(y1), r12=170(x2), r13=163(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 23
LDI r2, 73
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 117
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 394
LDI r11, 112
LDI r12, 170
LDI r13, 163
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
