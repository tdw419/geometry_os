; DESCRIPTION: Composite: Creates a black circular shape at (79, 132) with radius 77 then Renders a purple line between points (343, 151) and (25, 18).
; PLAN: r0=79(x), r1=132(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x1), r6=151(y1), r7=25(x2), r8=18(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 132
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 151
LDI r7, 25
LDI r8, 18
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
