; DESCRIPTION: Composite: Renders a orange line between points (472, 158) and (438, 143) then Sets a single purple pixel at (210, 58) then Renders a green box of size 25x90 starting at (123, 127).
; PLAN: r0=472(x1), r1=158(y1), r2=438(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=210(x), r6=58(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=123(x), r11=127(y), r12=25(width), r13=90(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 158
LDI r2, 438
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 58
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 123
LDI r11, 127
LDI r12, 25
LDI r13, 90
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
