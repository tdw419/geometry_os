; DESCRIPTION: Composite: Draws a yellow line from (202, 30) to (172, 195) then Places a white circle of radius 63 at center (301, 75) then Places a red dot at position (83, 203).
; PLAN: r0=202(x1), r1=30(y1), r2=172(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=75(y), r7=63(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=83(x), r11=203(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 202
LDI r1, 30
LDI r2, 172
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 75
LDI r7, 63
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 83
LDI r11, 203
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
