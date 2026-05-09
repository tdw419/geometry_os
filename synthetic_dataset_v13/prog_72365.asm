; DESCRIPTION: Composite: Places a magenta 111x117 rectangle at position (323, 47) then Draws a white line from (87, 92) to (475, 156) then Sets a single blue pixel at (230, 18).
; PLAN: r0=323(x), r1=47(y), r2=111(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=92(y1), r7=475(x2), r8=156(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=230(x), r11=18(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 323
LDI r1, 47
LDI r2, 111
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 92
LDI r7, 475
LDI r8, 156
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 18
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
