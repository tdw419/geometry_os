; DESCRIPTION: Composite: Draws a blue line from (54, 21) to (461, 189) then Places a red dot at position (489, 102).
; PLAN: r0=54(x1), r1=21(y1), r2=461(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=489(x), r6=102(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 54
LDI r1, 21
LDI r2, 461
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 102
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
