; DESCRIPTION: Composite: Sets a single orange pixel at (443, 134) then Places a green circle of radius 13 at center (321, 100) then Renders a white line between points (121, 245) and (138, 227).
; PLAN: r0=443(x), r1=134(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=100(y), r7=13(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=121(x1), r11=245(y1), r12=138(x2), r13=227(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 134
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 321
LDI r6, 100
LDI r7, 13
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 121
LDI r11, 245
LDI r12, 138
LDI r13, 227
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
