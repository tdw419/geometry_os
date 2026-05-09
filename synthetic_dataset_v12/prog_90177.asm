; DESCRIPTION: Composite: Renders a black line between points (360, 102) and (500, 178) then Places a orange dot at position (506, 143).
; PLAN: r0=360(x1), r1=102(y1), r2=500(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=506(x), r6=143(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 360
LDI r1, 102
LDI r2, 500
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 143
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
