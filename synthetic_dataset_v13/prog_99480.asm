; DESCRIPTION: Composite: Creates a purple circular shape at (312, 73) with radius 51 then Draws a cyan line from (29, 246) to (424, 145).
; PLAN: r0=312(x), r1=73(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x1), r6=246(y1), r7=424(x2), r8=145(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 73
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 246
LDI r7, 424
LDI r8, 145
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
