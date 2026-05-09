; DESCRIPTION: Composite: Renders a cyan line between points (69, 178) and (125, 55) then Sets a single red pixel at (187, 43) then Places a purple circle of radius 52 at center (152, 98).
; PLAN: r0=69(x1), r1=178(y1), r2=125(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=43(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=152(x), r11=98(y), r12=52(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 69
LDI r1, 178
LDI r2, 125
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 43
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 152
LDI r11, 98
LDI r12, 52
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
