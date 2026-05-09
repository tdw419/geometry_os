; DESCRIPTION: Composite: Draws a yellow line from (252, 182) to (285, 25) then Draws a white circle centered at (143, 75) with radius 74.
; PLAN: r0=252(x1), r1=182(y1), r2=285(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=75(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 252
LDI r1, 182
LDI r2, 285
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 75
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
