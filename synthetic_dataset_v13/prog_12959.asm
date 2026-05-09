; DESCRIPTION: Composite: Draws a orange line from (163, 11) to (198, 246) then Places a magenta dot at position (230, 180).
; PLAN: r0=163(x1), r1=11(y1), r2=198(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=180(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 163
LDI r1, 11
LDI r2, 198
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 180
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
