; DESCRIPTION: Composite: Draws a red circle centered at (461, 65) with radius 29 then Draws a purple line from (311, 10) to (279, 178).
; PLAN: r0=461(x), r1=65(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x1), r6=10(y1), r7=279(x2), r8=178(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 65
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 10
LDI r7, 279
LDI r8, 178
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
