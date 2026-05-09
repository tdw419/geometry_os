; DESCRIPTION: Composite: Renders a orange line between points (419, 131) and (415, 106) then Places a purple dot at position (327, 95).
; PLAN: r0=419(x1), r1=131(y1), r2=415(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=95(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 419
LDI r1, 131
LDI r2, 415
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 95
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
