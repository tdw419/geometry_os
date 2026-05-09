; DESCRIPTION: Composite: Renders a orange line between points (79, 10) and (125, 211) then Sets a single white pixel at (349, 217) then Draws a cyan circle centered at (443, 220) with radius 19.
; PLAN: r0=79(x1), r1=10(y1), r2=125(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=217(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=443(x), r11=220(y), r12=19(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 79
LDI r1, 10
LDI r2, 125
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 217
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 443
LDI r11, 220
LDI r12, 19
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
