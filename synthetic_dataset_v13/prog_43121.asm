; DESCRIPTION: Composite: Renders a blue line between points (264, 143) and (344, 83) then Places a red dot at position (206, 126).
; PLAN: r0=264(x1), r1=143(y1), r2=344(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=126(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 143
LDI r2, 344
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 126
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
