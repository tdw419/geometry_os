; DESCRIPTION: Composite: Renders a red line between points (387, 0) and (433, 23) then Places a white dot at position (17, 155).
; PLAN: r0=387(x1), r1=0(y1), r2=433(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=155(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 387
LDI r1, 0
LDI r2, 433
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 155
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
