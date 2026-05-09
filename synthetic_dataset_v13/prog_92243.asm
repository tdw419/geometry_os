; DESCRIPTION: Composite: Draws a white line from (437, 125) to (425, 52) then Places a blue circle of radius 54 at center (205, 82) then Sets a single black pixel at (210, 137).
; PLAN: r0=437(x1), r1=125(y1), r2=425(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=82(y), r7=54(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=210(x), r11=137(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 437
LDI r1, 125
LDI r2, 425
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 82
LDI r7, 54
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 210
LDI r11, 137
LDI r12, 0x000000
PSET r10, r11, r12
HALT
