; DESCRIPTION: Composite: Places a magenta dot at position (47, 96) then Renders a orange line between points (226, 71) and (95, 230) then Creates a orange circular shape at (335, 60) with radius 16.
; PLAN: r0=47(x), r1=96(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=226(x1), r6=71(y1), r7=95(x2), r8=230(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=335(x), r11=60(y), r12=16(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 96
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 226
LDI r6, 71
LDI r7, 95
LDI r8, 230
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 60
LDI r12, 16
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
