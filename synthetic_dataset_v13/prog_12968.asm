; DESCRIPTION: Composite: Places a orange dot at position (393, 168) then Draws a white line from (278, 165) to (40, 82) then Creates a orange circular shape at (107, 70) with radius 35.
; PLAN: r0=393(x), r1=168(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=278(x1), r6=165(y1), r7=40(x2), r8=82(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=107(x), r11=70(y), r12=35(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 168
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 278
LDI r6, 165
LDI r7, 40
LDI r8, 82
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 70
LDI r12, 35
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
