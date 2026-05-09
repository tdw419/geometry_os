; DESCRIPTION: Composite: Draws a red line from (193, 138) to (19, 161) then Places a orange circle of radius 65 at center (241, 167) then Places a black dot at position (179, 28).
; PLAN: r0=193(x1), r1=138(y1), r2=19(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=167(y), r7=65(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=179(x), r11=28(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 138
LDI r2, 19
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 167
LDI r7, 65
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 179
LDI r11, 28
LDI r12, 0x000000
PSET r10, r11, r12
HALT
