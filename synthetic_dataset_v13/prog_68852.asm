; DESCRIPTION: Composite: Renders a red line between points (307, 85) and (114, 27) then Creates a white circular shape at (430, 105) with radius 78.
; PLAN: r0=307(x1), r1=85(y1), r2=114(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=105(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 307
LDI r1, 85
LDI r2, 114
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 105
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
