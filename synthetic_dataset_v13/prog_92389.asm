; DESCRIPTION: Composite: Renders a cyan line between points (25, 125) and (125, 117) then Sets a single black pixel at (60, 7) then Draws a orange circle centered at (355, 74) with radius 62.
; PLAN: r0=25(x1), r1=125(y1), r2=125(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=7(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=355(x), r11=74(y), r12=62(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 125
LDI r2, 125
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 7
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 355
LDI r11, 74
LDI r12, 62
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
