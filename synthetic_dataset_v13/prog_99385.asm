; DESCRIPTION: Composite: Renders a orange line between points (416, 236) and (138, 143) then Sets a single black pixel at (442, 140).
; PLAN: r0=416(x1), r1=236(y1), r2=138(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=140(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 236
LDI r2, 138
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 140
LDI r7, 0x000000
PSET r5, r6, r7
HALT
