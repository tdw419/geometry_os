; DESCRIPTION: Composite: Renders a red line between points (419, 181) and (256, 58) then Places a black dot at position (231, 72).
; PLAN: r0=419(x1), r1=181(y1), r2=256(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=72(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 419
LDI r1, 181
LDI r2, 256
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 72
LDI r7, 0x000000
PSET r5, r6, r7
HALT
