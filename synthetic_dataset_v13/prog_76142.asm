; DESCRIPTION: Composite: Places a orange dot at position (462, 0) then Renders a black line between points (381, 206) and (148, 60) then Places a white circle of radius 70 at center (306, 131).
; PLAN: r0=462(x), r1=0(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=381(x1), r6=206(y1), r7=148(x2), r8=60(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=131(y), r12=70(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 462
LDI r1, 0
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 381
LDI r6, 206
LDI r7, 148
LDI r8, 60
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 131
LDI r12, 70
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
