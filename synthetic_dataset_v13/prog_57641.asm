; DESCRIPTION: Composite: Draws a red line from (175, 247) to (498, 157) then Creates a black circular shape at (335, 65) with radius 42.
; PLAN: r0=175(x1), r1=247(y1), r2=498(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=65(y), r7=42(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 175
LDI r1, 247
LDI r2, 498
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 65
LDI r7, 42
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
