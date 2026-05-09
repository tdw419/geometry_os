; DESCRIPTION: Composite: Renders a black line between points (80, 41) and (324, 26) then Places a purple dot at position (416, 45).
; PLAN: r0=80(x1), r1=41(y1), r2=324(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=45(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 80
LDI r1, 41
LDI r2, 324
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 45
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
