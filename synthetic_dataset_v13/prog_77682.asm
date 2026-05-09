; DESCRIPTION: Composite: Draws a white line from (392, 92) to (4, 251) then Draws a orange circle centered at (248, 183) with radius 71.
; PLAN: r0=392(x1), r1=92(y1), r2=4(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=183(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 392
LDI r1, 92
LDI r2, 4
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 183
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
