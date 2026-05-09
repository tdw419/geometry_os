; DESCRIPTION: Composite: Draws a purple line from (123, 19) to (427, 193) then Places a blue 34x65 rectangle at position (62, 138) then Places a black dot at position (308, 184).
; PLAN: r0=123(x1), r1=19(y1), r2=427(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=138(y), r7=34(width), r8=65(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x), r11=184(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 123
LDI r1, 19
LDI r2, 427
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 138
LDI r7, 34
LDI r8, 65
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 184
LDI r12, 0x000000
PSET r10, r11, r12
HALT
