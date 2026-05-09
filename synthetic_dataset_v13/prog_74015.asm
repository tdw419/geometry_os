; DESCRIPTION: Composite: Renders a black disk with center (467, 42) and radius 11 then Draws a green line from (411, 74) to (170, 105).
; PLAN: r0=467(x), r1=42(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x1), r6=74(y1), r7=170(x2), r8=105(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 467
LDI r1, 42
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 74
LDI r7, 170
LDI r8, 105
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
