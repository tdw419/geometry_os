; DESCRIPTION: Composite: Creates a orange circular shape at (393, 143) with radius 65 then Renders a red line between points (338, 206) and (105, 131) then Sets a single black pixel at (288, 251).
; PLAN: r0=393(x), r1=143(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x1), r6=206(y1), r7=105(x2), r8=131(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=288(x), r11=251(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 143
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 206
LDI r7, 105
LDI r8, 131
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 251
LDI r12, 0x000000
PSET r10, r11, r12
HALT
