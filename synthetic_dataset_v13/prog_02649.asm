; DESCRIPTION: Composite: Renders a green line between points (428, 52) and (408, 87) then Places a white circle of radius 33 at center (86, 187) then Sets a single black pixel at (330, 4).
; PLAN: r0=428(x1), r1=52(y1), r2=408(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=187(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=330(x), r11=4(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 428
LDI r1, 52
LDI r2, 408
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 187
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 330
LDI r11, 4
LDI r12, 0x000000
PSET r10, r11, r12
HALT
