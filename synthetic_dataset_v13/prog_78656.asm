; DESCRIPTION: Composite: Renders a black line between points (12, 199) and (287, 220) then Creates a purple rectangular region at (386, 125) spanning 55 by 91 pixels then Places a orange dot at position (178, 150).
; PLAN: r0=12(x1), r1=199(y1), r2=287(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=125(y), r7=55(width), r8=91(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=178(x), r11=150(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 12
LDI r1, 199
LDI r2, 287
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 125
LDI r7, 55
LDI r8, 91
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 150
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
