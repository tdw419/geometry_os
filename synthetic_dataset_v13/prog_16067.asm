; DESCRIPTION: Composite: Draws a black line from (170, 49) to (489, 118) then Creates a white circular shape at (346, 205) with radius 51.
; PLAN: r0=170(x1), r1=49(y1), r2=489(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=205(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 170
LDI r1, 49
LDI r2, 489
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 205
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
