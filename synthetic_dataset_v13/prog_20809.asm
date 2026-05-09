; DESCRIPTION: Composite: Places a blue 51x61 rectangle at position (39, 102) then Draws a purple line from (343, 145) to (248, 156).
; PLAN: r0=39(x), r1=102(y), r2=51(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x1), r6=145(y1), r7=248(x2), r8=156(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 102
LDI r2, 51
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 145
LDI r7, 248
LDI r8, 156
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
