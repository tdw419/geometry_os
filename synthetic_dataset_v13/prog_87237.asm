; DESCRIPTION: Composite: Draws a green rectangle at (444, 189) with width 26 and height 31 then Sets a single magenta pixel at (143, 206) then Draws a magenta line from (161, 152) to (292, 98).
; PLAN: r0=444(x), r1=189(y), r2=26(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=206(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=161(x1), r11=152(y1), r12=292(x2), r13=98(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 189
LDI r2, 26
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 206
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 161
LDI r11, 152
LDI r12, 292
LDI r13, 98
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
