; DESCRIPTION: Composite: Draws a purple line from (154, 142) to (163, 82) then Places a blue dot at position (474, 246).
; PLAN: r0=154(x1), r1=142(y1), r2=163(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=474(x), r6=246(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 154
LDI r1, 142
LDI r2, 163
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 246
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
