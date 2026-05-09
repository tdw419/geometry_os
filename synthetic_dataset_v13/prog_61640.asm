; DESCRIPTION: Composite: Draws a black circle centered at (296, 179) with radius 65 then Draws a white line from (286, 93) to (33, 199) then Sets a single black pixel at (509, 52).
; PLAN: r0=296(x), r1=179(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x1), r6=93(y1), r7=33(x2), r8=199(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=509(x), r11=52(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 296
LDI r1, 179
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 93
LDI r7, 33
LDI r8, 199
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 509
LDI r11, 52
LDI r12, 0x000000
PSET r10, r11, r12
HALT
