; DESCRIPTION: Composite: Creates a orange circular shape at (265, 157) with radius 62 then Draws a green line from (1, 137) to (341, 13) then Sets a single white pixel at (425, 133).
; PLAN: r0=265(x), r1=157(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x1), r6=137(y1), r7=341(x2), r8=13(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=425(x), r11=133(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 265
LDI r1, 157
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 137
LDI r7, 341
LDI r8, 13
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 133
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
