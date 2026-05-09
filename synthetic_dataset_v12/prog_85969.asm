; DESCRIPTION: Composite: Draws a red line from (192, 93) to (438, 70) then Places a white dot at position (282, 149).
; PLAN: r0=192(x1), r1=93(y1), r2=438(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=149(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 192
LDI r1, 93
LDI r2, 438
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 149
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
