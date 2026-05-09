; DESCRIPTION: Composite: Draws a red line from (500, 154) to (231, 187) then Sets a single red pixel at (125, 8) then Draws a cyan circle centered at (247, 79) with radius 43.
; PLAN: r0=500(x1), r1=154(y1), r2=231(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=8(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=247(x), r11=79(y), r12=43(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 500
LDI r1, 154
LDI r2, 231
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 8
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 247
LDI r11, 79
LDI r12, 43
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
