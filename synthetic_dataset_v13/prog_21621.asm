; DESCRIPTION: Composite: Draws a orange line from (61, 94) to (312, 62) then Places a white dot at position (119, 226).
; PLAN: r0=61(x1), r1=94(y1), r2=312(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=226(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 94
LDI r2, 312
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 226
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
