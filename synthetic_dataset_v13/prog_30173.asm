; DESCRIPTION: Composite: Places a cyan dot at position (131, 246) then Draws a purple line from (505, 244) to (475, 189).
; PLAN: r0=131(x), r1=246(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=505(x1), r6=244(y1), r7=475(x2), r8=189(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 246
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 505
LDI r6, 244
LDI r7, 475
LDI r8, 189
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
