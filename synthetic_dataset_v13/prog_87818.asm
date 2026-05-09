; DESCRIPTION: Composite: Renders a orange line between points (483, 184) and (243, 79) then Places a white dot at position (71, 230).
; PLAN: r0=483(x1), r1=184(y1), r2=243(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=230(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 483
LDI r1, 184
LDI r2, 243
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 230
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
