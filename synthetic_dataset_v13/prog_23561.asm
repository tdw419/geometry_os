; DESCRIPTION: Composite: Places a orange circle of radius 65 at center (389, 142) then Draws a red line from (185, 39) to (238, 118).
; PLAN: r0=389(x), r1=142(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x1), r6=39(y1), r7=238(x2), r8=118(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 142
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 39
LDI r7, 238
LDI r8, 118
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
