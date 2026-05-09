; DESCRIPTION: Composite: Places a red circle of radius 44 at center (420, 107) then Draws a orange line from (25, 51) to (183, 170).
; PLAN: r0=420(x), r1=107(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x1), r6=51(y1), r7=183(x2), r8=170(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 107
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 51
LDI r7, 183
LDI r8, 170
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
