; DESCRIPTION: Composite: Draws a orange line from (357, 199) to (281, 223) then Places a black 25x119 rectangle at position (140, 73) then Sets a single white pixel at (238, 130).
; PLAN: r0=357(x1), r1=199(y1), r2=281(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=73(y), r7=25(width), r8=119(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=238(x), r11=130(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 357
LDI r1, 199
LDI r2, 281
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 73
LDI r7, 25
LDI r8, 119
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 130
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
