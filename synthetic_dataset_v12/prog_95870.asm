; DESCRIPTION: Composite: Draws a red line from (14, 185) to (477, 130) then Sets a single white pixel at (264, 150).
; PLAN: r0=14(x1), r1=185(y1), r2=477(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=150(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 14
LDI r1, 185
LDI r2, 477
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 150
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
